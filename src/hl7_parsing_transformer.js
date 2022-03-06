var hl7_json_patient = {};
hl7Patient.first_name = msg['PID']['PID.5']['PID.5.2'].toString();
hl7Patient.last_name = msg['PID']['PID.5']['PID.5.1'].toString();
hl7Patient.date_of_birth = msg['PID']['PID.7']['PID.7.1'].toString();
hl7Patient.phone = msg['PID']['PID.13']['PID.13.1'].toString();
hl7Patient.id = msg['PID']['PID.1']['PID.1.1'].toString();
channelMap.put('hl7Patient', hl7Patient);