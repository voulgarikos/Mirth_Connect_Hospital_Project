# Mirth_Connect_Hospital_Project
Project creating a simple Hospital DBMS in SQL Server and connecting to it with Mirth Connect and ingesting it with HL7 format Data.

The Project is divided into three parts. The txt files contain the full description of the settings required.

##### Part 1 Create a channel and Deploy it.

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/3fafb3f5cae2504fda7d3fb3d1643a026d5a716d/Assets/Screenshot%202022-03-02%20185828.png)
Channel Source Settings
##### Part 2 Connect to and query the Sql Server hospital DB. Print the aqcuired Data in a txt file.

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/11b9d4bc13b6ef61711fb50d4bb7b45720170cb8/Assets/Screenshot%202022-03-02%20190553.png)
Channel Destination Settings

##### Part 3 Connect to HL7 Server, map the variables and parse the Data.

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/2dd7cddc1849ea020a71c381f6238bb8b8f1a7ba/Assets/mirth_hl7_channel_summary.png)
Channel initialize

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/ccffedbda3da44f073b21c052a55854fa94e1b5b/Assets/mirth_hl7_channel_source.png)
Source Settings

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/9ac7ae19c164488ec29d1f521dd7b1888b6077dd/Assets/mirth_hl7_channel_transformer_json.png)
Transformer Editing with javascript

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/6b0f5724bbc9e61a140bdb2c05d201c3d06e7521/Assets/mirth_hl7_channel_json_text_destination.png)
Destination Settings

![This is an image](https://github.com/voulgarikos/Mirth_Connect_Hospital_Project/blob/fbd10084c40b46a86b70af81bd1ddae0d2b7e512/Assets/mirth_hl7_channel_json_message_ok.png)
Message processed!
