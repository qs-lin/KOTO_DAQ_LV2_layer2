library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity mem_write_control_v3 is
  port (
    --The clock
    clock               : in  std_logic;
    --Asynchronous reset
    reset               : in  std_logic;
	data_in		   	   : in  std_logic_vector(31 downto 0);
	mem_upper_limit		: in  std_logic_vector(17 downto 0);	 

    data_out            : out std_logic_vector(31 downto 0) := (others => '0');
	data_wr_req	      : out std_logic;
	data_wr_addr	      : out std_logic_vector(17 downto 0) := (others => '0');
	event_size          : out std_logic_vector(14 downto 0) := (others => '0');    -- max = 2^15-1
	es_wr_req           : out std_logic                     := '0';	 
	es_wr_addr	         : out std_logic_vector(5 downto 0)  := (others => '0');	 
	L1A_event           : out std_logic_vector(13 downto 0) := (others => '0');
	L1A_wr_req          : out std_logic                     := '0';	 
	L1A_wr_addr	      : out std_logic_vector(5 downto 0)  := (others => '0');	
     
	-- seperate two error regs. controlled by two process. 
	error_00	         : out std_logic_vector(10 downto 0) := (others => '0');
	write_rounds	      : out std_logic_vector(15 downto 0) := (others => '0');
	event_in_progress   : out std_logic                     := '0';
	error_01            : out std_logic                     := '0'	 
    );
end mem_write_control_v3;

architecture behaviour of mem_write_control_v3 is 

  type state_type is (layer1_header, adc_header, adc_energy, adc_footer, layer1_footer
                      );
							 
  signal next_state   : state_type := layer1_header;
  --signal event_in_progress_sig  : std_logic;
  --signal data_pipe    : std_logic_vector(31 downto 0) := (others => '0');

begin

  state_machine : process(reset, clock)
  
    variable nstate                 : state_type                    := layer1_header; 
	variable event_size_sig         : unsigned(14 downto 0)         := (others => '0');
	--variable L1A_metric             : std_logic_vector(13 downto 0) := (others => '0');
	variable L1A_metric             : std_logic_vector(13 downto 0) := (others => '0');
	--variable L1A_adc_header         : unsigned(13 downto 0)         := (others => '0');
	 
    variable data_wr_addr_sig       : unsigned(17 downto 0)         := (others => '0'); 
    variable es_wr_addr_sig         : unsigned(5 downto 0)          := (others => '0');	 
    variable L1A_wr_addr_sig        : unsigned(5 downto 0)          := (others => '0');	 
	 
	variable event_in_progress_sig  : std_logic;
	 
    variable cnt_adc_header         : integer                       := 0;
    variable cnt_adc_footer         : integer                       := 0;	 
    variable cnt_adc_packet         : integer                       := 0;	 	 
 
    variable write_rounds_sig       : unsigned(15 downto 0)         := (others => '0');	 

	 
	begin
    if (reset = '1') then
	  -- interface
      data_out          <= (others => '0');
	  data_wr_req       <= '0';
      data_wr_addr      <= (others => '0');
      event_size        <= (others => '0');
	  es_wr_req         <= '0';
      es_wr_addr        <= (others => '0');
      L1A_event         <= (others => '0');
	  L1A_wr_req        <= '0';
      L1A_wr_addr       <= (others => '0');		

      error_00          <= (others => '0');	
      write_rounds      <= (others => '0');	
      -- internal logic
      next_state            <= layer1_header;				
      L1A_metric            := (others => '0');		
      event_size_sig        := (others => '0');
      data_wr_addr_sig      := (others => '0');
      es_wr_addr_sig        := (others => '0');
      L1A_wr_addr_sig       := (others => '0');		
      event_in_progress_sig := '0'; 
      cnt_adc_header        := 0;
      cnt_adc_footer        := 0;
      cnt_adc_packet        := 0;
      write_rounds_sig      := (others => '0');
		
    elsif rising_edge(clock) then
	 
	  --data_pipe           <= data_in;

      data_out            <= data_in;
		
      case next_state is
		
        when layer1_header =>
	    -- Initialization
          data_wr_req         <= '0';
		  es_wr_req           <= '0';
		  L1A_wr_req          <= '0';		  
		  if( data_in(31 downto 26) = "001111" ) then
--			   if(event_in_progress_sig = '1') then
--				  error(0)            <= '1';  
--				end if;  
            event_in_progress_sig := '1';
			event_size_sig        := to_unsigned(1, event_size_sig'length);	
			--extract L1A from Layer1 header					
			L1A_metric            := (data_in(13 downto 0)); 	
			data_wr_req           <= '1';	
			data_wr_addr_sig      := data_wr_addr_sig + 1;						
			next_state            <= adc_header;				
	      end if;	

		  when adc_header =>	
            data_wr_req         <= '0';
		    es_wr_req           <= '0';
		    L1A_wr_req          <= '0';			  
	       if( data_in(31 downto 30) = "11" and data_in(15 downto 14) = "11" ) then
			 
--			   if(event_in_progress_sig = '0') then
--				  error(1)           <= '1';
--				end if;  
			 event_size_sig       := event_size_sig + 1;
			 data_wr_req          <= '1';	
			 data_wr_addr_sig     := data_wr_addr_sig + 1;			
			 cnt_adc_header       := cnt_adc_header + 1;
			 if(cnt_adc_header = 3) then
			   next_state         <= adc_energy;		
			   --L1A_adc_header     := unsigned(data_in(13 downto 0));
               if( data_in(13 downto 0) /= L1A_metric ) then
                 error_00(0)      <= '1';
				end if;	 				  
		      end if;
			end if;		  
			 
		  when adc_energy =>	
            data_wr_req         <= '0';
		    es_wr_req           <= '0';
		    L1A_wr_req          <= '0';			  
			 --EE
	        if( data_in(31 downto 30) = "10" and data_in(15 downto 14) = "10" ) then
			  event_size_sig       := event_size_sig + 1;
              data_wr_req          <= '1';	
              data_wr_addr_sig     := data_wr_addr_sig + 1;	
				
--			 --EF, FF both mean we should go to footer
--			 elsif( ( data_in(31 downto 30) = "10" or data_in(31 downto 28) = "0110" ) and data_in(15 downto 12) = "0110" ) then
--			   event_size_sig       := event_size_sig + 1;
--				data_wr_req          <= '1';	
--			   data_wr_addr_sig     := data_wr_addr_sig + 1;
--				cnt_adc_footer       := 1;
--				next_state           <= adc_footer;		
--			 end if;

		  --EF	
		    elsif( data_in(31 downto 30) = "10" and data_in(15 downto 12) = "0110" ) then
			  event_size_sig       := event_size_sig + 1;
			  data_wr_req          <= '1';	
			  data_wr_addr_sig     := data_wr_addr_sig + 1;	
              next_state           <= adc_footer;	
		  --FF		
		    elsif( data_in(31 downto 28) = "0110" and data_in(15 downto 12) = "0110" ) then
              event_size_sig       := event_size_sig + 1;
              data_wr_req          <= '1';	
              data_wr_addr_sig     := data_wr_addr_sig + 1;
              cnt_adc_footer       := 1;	
              next_state           <= adc_footer;	
				
		    end if;		
				
		  when adc_footer =>		 
            data_wr_req         <= '0';
		    es_wr_req           <= '0';
		    L1A_wr_req          <= '0';			  
			if(  data_in(31 downto 28) = "0110" and ( data_in(15 downto 12) = "0110" or data_in(15 downto 0) = X"0000" ) )then
              event_size_sig       := event_size_sig + 1;
              data_wr_req          <= '1';	
              data_wr_addr_sig     := data_wr_addr_sig + 1;
              cnt_adc_footer       := cnt_adc_footer + 1;			
			end if;
	  
	        if(cnt_adc_footer = 3) then
			  cnt_adc_packet       := cnt_adc_packet + 1;
			  -- receive packets from one crate = 16 adc 
              if(cnt_adc_packet = 16) then 
                next_state         <= layer1_footer;	  
              else
                next_state         <= adc_header;	
				cnt_adc_header     := 0;
				cnt_adc_footer     := 0;				  
              end if;
			end if;
			 
		  when layer1_footer =>
            data_wr_req         <= '0';
		    es_wr_req           <= '0';
		    L1A_wr_req          <= '0';			  
			if(  data_in(31 downto 26) = "001001" ) then
              event_size_sig         := event_size_sig + 1;				
              event_in_progress_sig  := '0';  
              L1A_event              <= L1A_metric;
              data_wr_addr_sig       := data_wr_addr_sig + 1;
              es_wr_addr_sig         := es_wr_addr_sig + 1;
              L1A_wr_addr_sig        := L1A_wr_addr_sig + 1;
				
              data_wr_req            <= '1';	
		      es_wr_req              <= '1';
		      L1A_wr_req             <= '1';				

              cnt_adc_header         := 0;
              cnt_adc_footer         := 0;
              cnt_adc_packet         := 0;				
              next_state             <= layer1_header;		
	
		    end if;

      end case;
		
	  if( data_wr_addr_sig > unsigned(mem_upper_limit) ) then
        data_wr_addr_sig := (others => '0');
		write_rounds_sig := write_rounds_sig + 1;
	  end if;	 
      data_wr_addr      <= std_logic_vector (data_wr_addr_sig);
      write_rounds      <= std_logic_vector (write_rounds_sig);
	 
      es_wr_addr        <= std_logic_vector (es_wr_addr_sig);
      L1A_wr_addr       <= std_logic_vector (L1A_wr_addr_sig);	 
      event_in_progress <= event_in_progress_sig;
      event_size        <= std_logic_vector (event_size_sig);
	 
end if;

  end process state_machine;  			 
			 
			 
  error_detect : process(reset, clock) 
  begin
    if( reset = '1') then
      error_01         <= '0';		 
    elsif rising_edge(clock) then
	 
      if( data_in(31 downto 26) = "001111" ) then
        if( next_state /= layer1_header ) then
          error_01     <= '1';
        end if;	 
      end if;
    end if;
		
  end process error_detect;			 

			 
end architecture behaviour;




