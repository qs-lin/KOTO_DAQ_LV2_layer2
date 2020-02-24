The second layer for KOTO LV2 daq.\
Event building for data from OFC-Layer1.\
Encapusulation inside Ethernet frame.\
Interface between OFC-Layer1 and PC LV3. \
Similar functions (L1A_check, receive_manager, ...) are only kept in KOTO_DAQ_LV2_layer1

```mermaid
graph LR
A[TSE] -->|ff_tx_septy|B(Mem_read_control)
    A --> |ff_tx_septy| C[EFG]
    B -->|data,data_valid| C[EFG]
    C -->|Two| E[Result two]
```
