{
	"contents": {
		"4fbd0762-4dd6-4e38-bb82-a831ff048cbd": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "com.ts.mdg.wf.createsupplier",
			"subject": "createsupplier",
			"name": "createsupplier",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				},
				"ae420203-5753-4e6e-89bc-0f8aad1f9bee": {
					"name": "EndEvent2"
				}
			},
			"activities": {
				"17b0443d-90a6-4f8d-9b4f-85ca7d2090cf": {
					"name": "ApproveSupplier"
				},
				"938ac005-3acd-47fd-968c-da446b740a2e": {
					"name": "CheckApprovalStatus"
				},
				"1b53c13f-f2c7-4c4d-9a53-d34dfb761c2a": {
					"name": "CreateSupplier"
				},
				"3f86f4b9-f059-4586-957f-e0691ad1d8fa": {
					"name": "Preparepayload"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"71e19951-9553-4d88-b70e-5464f033ba8a": {
					"name": "SequenceFlow2"
				},
				"49c1f41a-9cb8-4376-8bc2-19d41384df54": {
					"name": "Approved"
				},
				"bffa627d-da15-4dd6-bbc4-9ee88624e34f": {
					"name": "SequenceFlow4"
				},
				"c4299d2b-4090-4791-b068-b2e56970b092": {
					"name": "SequenceFlow5"
				},
				"8ff57125-e146-47c0-8774-5f4bcf12e38b": {
					"name": "Rejected"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"ae420203-5753-4e6e-89bc-0f8aad1f9bee": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "EndEvent2"
		},
		"17b0443d-90a6-4f8d-9b4f-85ca7d2090cf": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Supplier",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://createsupplierapprt.comtsmdguiapprovesupplierui/com.ts.mdg.ui.approvesupplierui",
			"recipientUsers": "kvv.satyasunil@gmail.com",
			"id": "usertask1",
			"name": "ApproveSupplier"
		},
		"938ac005-3acd-47fd-968c-da446b740a2e": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "CheckApprovalStatus",
			"default": "8ff57125-e146-47c0-8774-5f4bcf12e38b"
		},
		"1b53c13f-f2c7-4c4d-9a53-d34dfb761c2a": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "TS_S4P_SYS_USER",
			"path": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/API_BUSINESS_PARTNER/A_BusinessPartner",
			"requestVariable": "${context.internal.BPCreationPayload}",
			"responseVariable": "${context.internal.BPCreationResponse}",
			"id": "servicetask1",
			"name": "CreateSupplier"
		},
		"3f86f4b9-f059-4586-957f-e0691ad1d8fa": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/createsupplier/PreparePayload.js",
			"id": "scripttask1",
			"name": "Preparepayload"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "17b0443d-90a6-4f8d-9b4f-85ca7d2090cf"
		},
		"71e19951-9553-4d88-b70e-5464f033ba8a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "17b0443d-90a6-4f8d-9b4f-85ca7d2090cf",
			"targetRef": "938ac005-3acd-47fd-968c-da446b740a2e"
		},
		"49c1f41a-9cb8-4376-8bc2-19d41384df54": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.processStatus== \"request is approved\"}",
			"id": "sequenceflow3",
			"name": "Approved",
			"sourceRef": "938ac005-3acd-47fd-968c-da446b740a2e",
			"targetRef": "3f86f4b9-f059-4586-957f-e0691ad1d8fa"
		},
		"bffa627d-da15-4dd6-bbc4-9ee88624e34f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "1b53c13f-f2c7-4c4d-9a53-d34dfb761c2a",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"c4299d2b-4090-4791-b068-b2e56970b092": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "3f86f4b9-f059-4586-957f-e0691ad1d8fa",
			"targetRef": "1b53c13f-f2c7-4c4d-9a53-d34dfb761c2a"
		},
		"8ff57125-e146-47c0-8774-5f4bcf12e38b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "Rejected",
			"sourceRef": "938ac005-3acd-47fd-968c-da446b740a2e",
			"targetRef": "ae420203-5753-4e6e-89bc-0f8aad1f9bee"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"d4ed6e35-884b-4294-9c20-cd8d3843efc6": {},
				"077d1e49-de7a-479d-972e-4cfc106f07f3": {},
				"7e87088f-2291-4765-bb44-8123dd0337d7": {},
				"db4cce37-c637-47cb-a063-4c251da10281": {},
				"d85824b6-3a08-411f-9894-253c18daa408": {},
				"d7487cb3-54df-480b-af75-9e9e8802e06b": {},
				"cda8957e-278a-4255-895e-5f113590137f": {},
				"62ad84c1-262d-43af-9813-4d3ab2bb74dd": {},
				"800dee23-d574-4fc7-a616-ceff0630a3d7": {},
				"9e93c708-0031-45e7-b62c-78336b20dea6": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 693,
			"y": 100,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,117 230,117",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "d4ed6e35-884b-4294-9c20-cd8d3843efc6",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"d4ed6e35-884b-4294-9c20-cd8d3843efc6": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 180,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "17b0443d-90a6-4f8d-9b4f-85ca7d2090cf"
		},
		"077d1e49-de7a-479d-972e-4cfc106f07f3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "230,117.5 365,117.5",
			"sourceSymbol": "d4ed6e35-884b-4294-9c20-cd8d3843efc6",
			"targetSymbol": "7e87088f-2291-4765-bb44-8123dd0337d7",
			"object": "71e19951-9553-4d88-b70e-5464f033ba8a"
		},
		"7e87088f-2291-4765-bb44-8123dd0337d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 344,
			"y": 96,
			"object": "938ac005-3acd-47fd-968c-da446b740a2e"
		},
		"db4cce37-c637-47cb-a063-4c251da10281": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "365,117.5 498,117.5",
			"sourceSymbol": "7e87088f-2291-4765-bb44-8123dd0337d7",
			"targetSymbol": "cda8957e-278a-4255-895e-5f113590137f",
			"object": "49c1f41a-9cb8-4376-8bc2-19d41384df54"
		},
		"d85824b6-3a08-411f-9894-253c18daa408": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 572,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "1b53c13f-f2c7-4c4d-9a53-d34dfb761c2a"
		},
		"d7487cb3-54df-480b-af75-9e9e8802e06b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "622,117.75 710.5,117.75",
			"sourceSymbol": "d85824b6-3a08-411f-9894-253c18daa408",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "bffa627d-da15-4dd6-bbc4-9ee88624e34f"
		},
		"cda8957e-278a-4255-895e-5f113590137f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 448,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "3f86f4b9-f059-4586-957f-e0691ad1d8fa"
		},
		"62ad84c1-262d-43af-9813-4d3ab2bb74dd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "498,118 622,118",
			"sourceSymbol": "cda8957e-278a-4255-895e-5f113590137f",
			"targetSymbol": "d85824b6-3a08-411f-9894-253c18daa408",
			"object": "c4299d2b-4090-4791-b068-b2e56970b092"
		},
		"800dee23-d574-4fc7-a616-ceff0630a3d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 469.5,
			"y": -23.5,
			"width": 35,
			"height": 35,
			"object": "ae420203-5753-4e6e-89bc-0f8aad1f9bee"
		},
		"9e93c708-0031-45e7-b62c-78336b20dea6": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "364,117 364,-19 417,-19 417,-9 494,-9",
			"sourceSymbol": "7e87088f-2291-4765-bb44-8123dd0337d7",
			"targetSymbol": "800dee23-d574-4fc7-a616-ceff0630a3d7",
			"object": "8ff57125-e146-47c0-8774-5f4bcf12e38b"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 2,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 1,
			"exclusivegateway": 1
		}
	}
}