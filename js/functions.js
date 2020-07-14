(function($)
{
    'use strict';
    $('#navbarResponsive ul li a.cat').click(
        function()
        {
            var category = $(this).attr('id');
            if(category!='contact')
            {
                var miniCatalogContent = $('div#mini-catalog-content');
                var catalog = document.getElementById('mini-catalog-content');
                var xhr = new XMLHttpRequest();
                var txt = "";
                var myObj;
                var data = {};
                var id=category.slice(3,8);
                data['categoria']=id;
                var json_string = JSON.stringify(data);
                xhr.open('POST',"assets/php/productos.php",true);
                xhr.setRequestHeader("Content-type", "application/json");
                xhr.send(json_string);

                xhr.onreadystatechange = function()
                {
                    if(this.readyState == 4 && this.status == 200)
                    {
                        txt += this.responseText;
                        myObj = JSON.parse(this.responseText);
                        miniCatalogContent.empty();
                        myObj.forEach(element => 
                        {
                            var divElement = document.createElement('div');
                            divElement.setAttribute('class','col-sm-6 col-md-4 col-lg-3 col-xl-3 my-3');
                            divElement.innerHTML='<div class="product tumbnail thumbnail-3"><a href="#"><img class="img-fluid h-100 rounded" src="assets/img/catalog/'+element.imagen+'.jpg" alt=""></a><div class="caption"><span>'+element.descripcion+'</span> </div></div>';
                            catalog.appendChild(divElement);
                        });
                    }
                }
            }
        }
    )
    $(function()
    {
        var divSocial=$('div#socialfloating');
        divSocial.find('a.cb-anchor').mouseenter(function()
        {
            $(this).find('span#social-float-layer').attr('class','');
        })
        .mouseleave(function()
        {
            $(this).find('span#social-float-layer').attr('class','social-float-layer');
        });
    });
})(jQuery);