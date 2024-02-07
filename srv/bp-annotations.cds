using { com.satinfotech.electronics as db} from '../db/schema';

service ElectronicsDB {
    entity Business_Partner as projection on db.Business_Partner;
    entity State as projection on db.State;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity Stock as projection on db.Product;
}


annotate ElectronicsDB.Business_Partner with @odata.draft.enabled;
annotate ElectronicsDB.Store with @odata.draft.enabled;
annotate ElectronicsDB.Product with @odata.draft.enabled;
annotate ElectronicsDB.Stock with @odata.draft.enabled;

annotate ElectronicsDB.Business_Partner with {
    pin_code     @assert.format: '^\d{6}$';
    gstinregx    @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[0-9]{1}$/';


}

annotate ElectronicsDB.Store with {
    pin_code     @assert.format: '^\d{6}$';
}

annotate ElectronicsDB.Product with { 
    product_img @validate.URL;
    product_cost @assert: 'product_cost <= product_sell';
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


//annotations for Store
annotate ElectronicsDB.Store with @(
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
            ID : 'StoreInfoFacet',
            Label : 'Store  Information',
            Target : '@UI.FieldGroup#Store',
        },
    ],    
);

annotate ElectronicsDB.Store with {
    store_state @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'State',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_state,
                    ValueListProperty : 'code'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
};

//annotations for product
annotate ElectronicsDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_ID
        },
        {
            $Type : 'UI.DataField',
            Value : product_name
        }, 
        {
            $Type : 'UI.DataField',
            Value : product_img
        },
        {
            $Type : 'UI.DataField',
            Value : product_cost
        },
        {
            $Type : 'UI.DataField',
            Value : product_sell
        }, 
    ],
    UI.SelectionFields: [ product_ID ],       

    UI.FieldGroup #Product : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : product_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : product_name,
            },            
            {
                $Type : 'UI.DataField',
                Value : product_img,
            },
            {
                $Type : 'UI.DataField',
                Value : product_cost,
            },
            {
                $Type : 'UI.DataField',
                Value : product_sell,
            },
                        
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'Product  Information',
            Target : '@UI.FieldGroup#Product',
        },
    ],    
);

/*annotate ElectronicsDB.Product with {
    @Common.Text: '{Product}'
    @Core.IsURL: true
    @Core.MediaType: 'image/jpg'
}*/

//annotations for stock
annotate ElectronicsDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID
        }, 
        {
            $Type : 'UI.DataField',
            Value : stock_qty
        },
    ],
    UI.SelectionFields: [ store_id, product_ID ],       

    UI.FieldGroup #Stock : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : store_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : product_ID,
            },            
            {
                $Type : 'UI.DataField',
                Value : stck_qty,
            },        
        ],
    },

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockInfoFacet',
            Label : 'Stock  Information',
            Target : '@UI.FieldGroup#Stock',
        },
    ],    
);

annotate ElectronicsDB.Stock with {
    store_ID @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store',
            CollectionPath : 'Store',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_ID,
                    ValueListProperty : 'store_ID'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );

    product_ID @(     
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product',
            CollectionPath : 'Product',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'product_ID'
                },
             
                {

                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'product_name'
                }
            ]
        }
    )
};
