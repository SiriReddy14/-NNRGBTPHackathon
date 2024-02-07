using { com.satinfotech.electronics as db} from '../db/schema';

service StoreDB {
    entity Store as projection on db.Store;
}

annotate StoreDB.Store with @odata.draft.enabled;

annotate StoreDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_ID
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
            Value : store_state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        }, 
    ],
    UI.SelectionFields: [ store_ID ],       

    UI.FieldGroup #Store : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : store_ID,
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
                Value : store_state,
            },
            {
                $Type : 'UI.DataField',
                Value : pin_code,
            }, 
                        
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BPInfoFacet',
            Label : 'BP Information',
            Target : '@UI.FieldGroup#Store',
        },
    ],    
);

/*annotate StoreDB.Store with {
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
    );
};*/