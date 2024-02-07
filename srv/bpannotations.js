const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {

    const { Business_Partner, State } = this.entities();
    
    this.on(['READ'], State, async(req) => {
        states = [
            {"code":"AP", "description":"Andhra Pradesh"},
            {"code":"AR", "description":"Arunachal Pradesh"},
            {"code":"AS", "description":"Assam"},
            {"code":"BR", "description":"Bihar"},
            {"code":"CG", "description":"Chhattisgarh"},
            {"code":"GA", "description":"Goa"},
            {"code":"GJ", "description":"Gujarat"},
            {"code":"HR", "description":"Haryana"},
            {"code":"HP", "description":"Himachal Pradesh"},
            {"code":"JK", "description":"Jammu and Kashmir"},
            {"code":"JH", "description":"Jharkhand"},
            {"code":"KA", "description":"Karnataka"},
            {"code":"KL", "description":"Kerala"},
            {"code":"MP", "description":"Madhya Pradesh"},
            {"code":"MH", "description":"Maharashtra"},
            {"code":"MN", "description":"Manipur"},
            {"code":"ML", "description":"Meghalaya"},
            {"code":"MZ", "description":"Mizoram"},
            {"code":"NL", "description":"Nagaland"},
            {"code":"OR", "description":"Orissa"},
            {"code":"PB", "description":"Punjab"},
            {"code":"RJ", "description":"Rajasthan"},
            {"code":"SK", "description":"Sikkim"},
            {"code":"TN", "description":"Tamil Nadu"},
            {"code":"TR", "description":"Tripura"},
            {"code":"UK", "description":"Uttarakhand"},
            {"code":"UP", "description":"Uttar Pradesh"},
            {"code":"WB", "description":"West Bengal"}
        ]
          states.$count=states.length;
          return states;
        });
});