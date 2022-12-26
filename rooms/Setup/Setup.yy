{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "Setup",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": null,
  "views": [
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1920,"hview":1080,"xport":0,"yport":0,"wport":1920,"hport":1080,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Cursor","instances":[],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"GUI","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_count","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Players",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"2",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":2.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":288.0,"y":135.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_49627F28","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"0",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":466.0,"y":135.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"start_game","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"clickable","path":"objects/o_setup_button/o_setup_button.yy",},"objectId":{"name":"o_setup_button","path":"objects/o_setup_button/o_setup_button.yy",},"value":"True",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button/o_setup_button.yy",},"objectId":{"name":"o_setup_button","path":"objects/o_setup_button/o_setup_button.yy",},"value":"Start Game",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button","path":"objects/o_setup_button/o_setup_button.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":3.0,"scaleY":1.5,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":960.0,"y":990.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_1","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 1",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":615.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_2","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 2",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":660.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_3","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 3",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":705.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_4","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 4",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":750.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_5","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 5",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"4",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":795.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_6","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 6",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"3",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":840.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_7","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 7",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"3",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":885.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"tech_8","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Number of Tech 8",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"3",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":930.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_75B96E25","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"1",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":615.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3AFA5E1E","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"2",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":660.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_CC6ADC8","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"3",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":705.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_70EF282A","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"4",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":750.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_15F79D77","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":795.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3BF573F6","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"6",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":840.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_13ADF17B","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"8",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":930.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2EBD6918","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"7",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.5949367,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.00003,"y":885.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_1_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 1 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"1",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":195.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_2_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 2 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"2",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":240.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_3_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 3 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"3",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":285.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_4_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 4 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"4",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":330.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_5_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 5 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"5",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":375.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_6_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 6 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"6",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":420.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_8_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 8 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"7",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":510.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_7_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 7 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"7",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":465.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"player_9_specie","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Player 9 Species",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"7",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":272.0,"y":555.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_679642B9","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"9",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":195.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_22194D0","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"10",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":415.99997,"y":240.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_608D1841","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"11",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":285.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2610D6B7","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"12",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":330.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_634F896","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"13",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":375.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_17B0163A","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"14",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":420.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4D6D4017","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"15",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":465.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_739EA29","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"16",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":510.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_352D8B69","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"17",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":0.59493643,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":416.0,"y":555.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_236B7FC7","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"button_text","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"my_attribute","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"value":"18",},
          ],"isDnd":false,"objectId":{"name":"o_setup_button_tick","path":"objects/o_setup_button_tick/o_setup_button_tick.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":850.0,"y":135.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"game_round_count","properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_text","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"Round Count",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"attribute_value","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"value":"8",},
          ],"isDnd":false,"objectId":{"name":"o_setup_attribute","path":"objects/o_setup_attribute/o_setup_attribute.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.75,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":672.0,"y":135.0,},
      ],"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":15,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Controllers","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_2FE8E2EB","properties":[],"isDnd":false,"objectId":{"name":"o_setup_controller","path":"objects/o_setup_controller/o_setup_controller.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":32.0,"y":1050.0,},
      ],"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":30,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":null,"colour":4278190080,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"inst_2FE8E2EB","path":"rooms/Setup/Setup.yy",},
    {"name":"start_game","path":"rooms/Setup/Setup.yy",},
    {"name":"player_count","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_1","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_2","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_3","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_4","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_5","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_6","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_7","path":"rooms/Setup/Setup.yy",},
    {"name":"tech_8","path":"rooms/Setup/Setup.yy",},
    {"name":"player_1_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_2_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_3_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_4_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_5_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_6_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_679642B9","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_22194D0","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_608D1841","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_2610D6B7","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_634F896","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_17B0163A","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_75B96E25","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_3AFA5E1E","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_CC6ADC8","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_70EF282A","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_15F79D77","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_3BF573F6","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_13ADF17B","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_2EBD6918","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_49627F28","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_236B7FC7","path":"rooms/Setup/Setup.yy",},
    {"name":"player_7_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"player_8_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_4D6D4017","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_739EA29","path":"rooms/Setup/Setup.yy",},
    {"name":"player_9_specie","path":"rooms/Setup/Setup.yy",},
    {"name":"inst_352D8B69","path":"rooms/Setup/Setup.yy",},
    {"name":"game_round_count","path":"rooms/Setup/Setup.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 1920,
    "Height": 1080,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": true,
    "clearViewBackground": false,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
}