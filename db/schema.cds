namespace com.satinfotech.electronics;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
bpn:[bpn]
}
entity Business_Partner: cuid, managed {
     @title: 'Business Partner Number'
     bpn:String(10);
     @title: 'Name'
     name: String(20) @mandatory;
     @title: 'Address1'  
     address1:String(40)  @mandatory;
     @title: 'Address2'
     address2:String(30)   @mandatory;
     @title:'City'
     city:String(40)   @mandatory;
     @title: 'State'
     state:String(50)  @mandatory;
     @title: 'PIN Code'
     pin_code: String(20)    @mandatory;
     @title: 'Is_gstn_registered'
     is_gstn_registered: Boolean default false;
     @title: 'GSTIN Number'
     gstinregx: String(30)    @mandatory;
     //@title: 'Is Vendor'
     //is_vendor: Boolean default false;
     //@title: 'Is Customer
     //is_customer: Boolean default false;

}

@cds.persistence.skip
entity State{ 
     @title: 'code'
     key code:String(10);
     @title: 'description'  
     description:String(40);
}

entity Store : cuid, managed {
    @title: 'Store ID'
    store_ID: String(20) @mandatory;
    @title: 'Name'
    name: String(20) @mandatory;
    @title: 'Address1'  
    address1:String(40)  @mandatory;
    @title: 'Adress2'
    address2:String(30)   @mandatory;
    @title:'City'
    city:String(40)   @mandatory;
    @title: 'State'
    store_state:String(30)  @mandatory;
    @title: 'PIN Code.'
    pin_code: String(20)    @mandatory;
}

entity Product : cuid, managed {
    @title: 'Product ID'
    product_ID: String(20) @mandatory;
    @title: 'Product Name'
    product_name: String(20) @mandatory;
    @title: 'Product Image URL'
    product_img: String(20) @mandatory;
    @title: 'Product Cost Price'
    product_cost: Decimal(14, 2) @currencyCode: 'INR' @mandatory;
    @title: 'Product Sell Price'
    product_sell: Decimal(14, 2) @currencyCode: 'INR' @mandatory;
}

entity Stock : cuid, managed {
    @title: 'Store_ID'
    store_id: Association to Store  @mandatory;
    @title: 'Product ID'
    product_id: Association to Product  @mandatory;
    @title: 'Stock quantity'
    stock_qty: String(20) @mandatory;

}


