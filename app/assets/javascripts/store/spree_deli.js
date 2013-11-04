//= require store/spree_frontend
simpleCart({
    checkout: {
        type: "SendForm" ,
        url: "http://example.com/your/custom/checkout/url"
    },
    cartColumns: [
        //A custom simplecart column for putting the quantity and increment and decrement items in one div for easier styling.
        { view: function(item, column){
            return	"<span>"+item.get('quantity')+"</span>" +
                "<div>" +
                "<a href='javascript:;' class='simpleCart_increment'><img src='/assets/store/increment.png' title='+1' alt='arrow up'/></a>" +
                "<a href='javascript:;' class='simpleCart_decrement'><img src='/assets/store/decrement.png' title='-1' alt='arrow down'/></a>" +
                "</div>";
        }, attr: 'custom' },
        //Name of the item
        { attr: "name" , label: false },
        //Subtotal of that row (quantity of that item * the price)
        { view: 'currency', attr: "total" , label: false  }
    ]
});