using { com.satinfotech.electronics as db} from '../db/schema';

service ElectronicsDB {
    entity Business_Partner as projection on db.Business_Partner;
    entity State as projection on db.State;
}

annotate ElectronicsDB.Business_Partner with @odata.draft.enabled;

annotate ElectronicsDB.Business_Partner with {
    pin_code     @assert.format: '^\d{6}$';
    gstinregx    @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[0-9]{1}$/';


}

annotate ElectronicsDB.State with @(
    UI.LineItem: [
       {
            $Type : 'UI.DataField',
            Value : code
        },
        {
            $Type : 'UI.DataField',
            Value : description
        },  
    ],
);

annotate ElectronicsDB.Business_Partner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bpn
        },     
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
            Value: is_gstn_registered
        },
        {
            $Type : 'UI.DataField',
            Value : gstinregx
        },
    
         
    ],
    UI.SelectionFields: [ bpn ],       

    UI.FieldGroup #BPN : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bpn,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },            
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type : 'UI.DataField',
                Value : city,
            },
            {
                $Type : 'UI.DataField',
                Value : state,
            },
            {
                $Type : 'UI.DataField',
                Value : pin_code,
            }, 
            {
                $Type : 'UI.DataField',
                Value : is_gstn_registered,
            },
            {
                $Type : 'UI.DataField',
                Value : gstinregx,
            }, 
                        
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BPInfoFacet',
            Label : 'BP Information',
            Target : '@UI.FieldGroup#BPN',
        },
    ],    
);

annotate ElectronicsDB.Business_Partner with {
    state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};