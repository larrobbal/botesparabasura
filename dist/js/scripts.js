(function ($) 
{
    "use strict";
    $('a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .click(function(event) 
    {
    // On-page links
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) 
        {
            // Figure out element to scroll to
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            // Does a scroll target exist?
            if (target.length) 
            {
                // Only prevent default if animation is actually gonna happen
                event.preventDefault();
                $('html, body').animate({scrollTop: target.offset().top}, 500, function(){
                    // Callback after animation
                    // Must change focus!
                    var $target = $(target);
                    $target.focus();
                    if ($target.is(":focus")) 
                    { // Checking if the target was focused
                        return false;
                    } 
                    else 
                    {
                        $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
                        $target.focus(); // Set focus again
                    };
                });
            }
        }
    });
    $(document).on("scroll", function()
    {
        var logo = document.querySelector('#navBrandDesk')
        var links = document.querySelector('#navbarMenu');
        var $window = $(window);
        if($window.width()>640)
        {
            if ($(document).scrollTop() > 100)
            {
                logo.classList.add('brand-shrink');
                links.classList.add('menu-shrink');
                $("#contactInfo").slideUp("fast");
            } 
            else 
            {
                $("#contactInfo").slideDown("fast");
                logo.classList.remove('brand-shrink');
                links.classList.remove('menu-shrink');
            }
        }
    });
    $(document).ready(function () {
        var xhr = new XMLHttpRequest();
        var catalogContent = $('div#mini-catalog-content');
        var catalog = document.getElementById('mini-catalog-content');
        var myObj;
        var data={};
        data['cat']=true;
        var json_string = JSON.stringify(data);
        xhr.open('POST',"assets/php/productos.php",true);
        xhr.setRequestHeader("Content-type", "application/json");
        xhr.send(json_string);

        xhr.onreadystatechange = function()
        {
            if(this.readyState == 4 && this.status == 200)
            {
                myObj = JSON.parse(this.responseText);
                catalogContent.empty();
                myObj.forEach(element => 
                {
                    var divElement = document.createElement('div');
                    divElement.setAttribute('class','mx-3 my-3 justify-center content-center items-center h-full');
                    divElement.setAttribute('id','mini-catalog-product');
                    divElement.innerHTML='<div class="flex justify-center my-2"><a href="#" class="max-w-min rounded bg-gray-400 bg-opacity-25 flex justify-center content-center items-center transition hover:shadow-xl duration-200 ease-in-out" id="'+element.idDescripcion+'" onclick="showModal(\''+element.idDescripcion+'\',\''+element.producto+'\',event)"><img class="object-center h-80 w-80 sm:h-80 sm:w-80 min-h-full min-w-max md:min-h-full md:min-w-max" src="assets/img/product/thumbnail/'+element.imagen+'.webp" alt="'+element.producto+'"></a></div><div><h2 class="text-2xl font-bold font-montserrat uppercase">'+element.producto+'</h2></div>';
                    catalog.appendChild(divElement);
                });
            }
        }
    });
    $(window).on('resize',function () {
        var $window = $(window);
        if($window.width()>=640 && !($('#mobile-menu').hasClass('hidden')))
            $('#mobile-menu').addClass('hidden');
        if($window.width()<640 && !($('#contactInfo').hasClass('hidden')))
            $('#contactInfo').addClass('hidden');
    });
    $(document).mouseup(function(e) 
    {
        var container = $("#dropdownNavbar");
        if (!container.is(e.target) && container.has(e.target).length === 0 && !container.hasClass('hidden'))
        {
            container.addClass('hidden');
        }
    });
    function dropdownMenuProducts()
    {
        const dropdownLink = document.querySelector("a#dropdownNavbarLink");
        const dropdownMenu = document.querySelector("#dropdownNavbar");
        dropdownLink.addEventListener("click", (e) => {
            e.preventDefault();
            if(dropdownMenu.classList.contains('hidden'))
                dropdownMenu.classList.remove('hidden');
            else
                dropdownMenu.classList.add('hidden');
        });
    }
    function dropdownMenuProductsMobile()
    {
        const dropdownLink = document.querySelector("a#dropdownNavbarLinkMobile");
        const dropdownMenu = document.querySelector("#dropdownNavbarMobile");
        dropdownLink.addEventListener("click", (e) => {
            e.preventDefault();
            if(dropdownMenu.classList.contains('hidden'))
            dropdownMenu.classList.remove('hidden');
            else
            dropdownMenu.classList.add('hidden');
        });
    }
    function clearNavbar(lista)
    {
        lista.forEach((product_category) =>{
            let subcategory_list = document.querySelector("#"+product_category.id+"-dropdown");
            if(subcategory_list.classList.contains('activeItem'))
            {
                subcategory_list.classList.add('hidden');
                subcategory_list.classList.remove('activeItem');
            }
        });
    }
    function dropdownProductsOptions()
    {
        const product_list = document.querySelectorAll("div#dropdownNavbar > div.menu-options > div.sub-option > a");
        
        product_list.forEach((product_category) =>{
            product_category.addEventListener("click",(e)=>{
                e.preventDefault();
                
                let subcategory_list = document.querySelector("#"+product_category.id+"-dropdown");
                if(subcategory_list.classList.contains('hidden'))
                {
                    clearNavbar(product_list);
                    subcategory_list.classList.add('activeItem');
                    subcategory_list.classList.remove('hidden');
                }
                else
                {
                    subcategory_list.classList.add('hidden');
                    subcategory_list.classList.remove('activeItem');
                }
            })
        });
    }
    function dropdownProductsOptionsMobile()
    {
        const product_list_mobile = document.querySelectorAll("div#dropdownNavbarMobile > ul > li > a");
        product_list_mobile.forEach((product_category_mobile) =>{
            product_category_mobile.addEventListener("click",(e)=>{
                e.preventDefault();
                var subcategory_list = document.querySelector("#"+product_category_mobile.id+"-dropdown");
                if(subcategory_list.classList.contains('hidden'))
                {
                    clearNavbar(product_list_mobile);
                    subcategory_list.classList.add('activeItem');
                    subcategory_list.classList.remove('hidden');
                }
                else
                {
                    subcategory_list.classList.add('hidden');
                    subcategory_list.classList.remove('activeItem');
                }
                    
            })
        });
    }
    function categoryDisplay()
    {
        window.onclick = function(e) {
            if (e.target.matches('div.dropdown-option > ul > li > a'))
            {
                var dropdownOptions = document.querySelectorAll('div.dropdown-option');
                dropdownOptions.forEach(categoryDropdownOption => {
                    if(!categoryDropdownOption.classList.contains('hidden'))
                    categoryDropdownOption.classList.add('hidden');
                });
                document.querySelectorAll('div.dropdown').forEach(element =>{
                    if(!element.classList.contains('hidden'))
                        element.classList.add('hidden');
                });
                if(!document.querySelector('div#mobile-menu').classList.contains('hidden'))
                    document.querySelector('div#mobile-menu').classList.add('hidden');
            }
        }
    }
    $(document).ready(dropdownMenuProducts);
    $(document).ready(dropdownMenuProductsMobile);
    $(document).ready(dropdownProductsOptions);
    $(document).ready(dropdownProductsOptionsMobile);
    $(document).ready(categoryDisplay);
})(jQuery); // End of use strict*
function showModal(idproducto,name,e)
{
    e.preventDefault();
    var spinner = new jQuerySpinner({
        parentId:'modal-template'
    });
    let windowHeight = window.scrollY;
    let modal = document.getElementById("modal-div");
    let layout = document.getElementById("modal-layout");
    let closeBtn = document.getElementById("close-btn");
    let okBtn = document.getElementById("ok-btn");
    modal.classList.toggle("hidden");
    modal.style.top = (window.scrollY+100)+"px";
    layout.classList.toggle("hidden");
    var heading = ['Descripcion:','Linea:','Acabado:','Material:','Calibre:','Capacidad:','Colores:','Anclaje:','Vaciado:','Largo Total:','Ancho Total:','Alto Total:','Diametro Total:','Largo Contenedor:','Ancho Contenedor:','Alto Contenedor:','Diametro Contenedor:','Largo Letrero:','Alto Letrero:','Adicional:'];
    var modalTitle = document.getElementById('modal-product-title');
    modalTitle.innerHTML=name;
    var modalBody = $('#row-modal');
    var aux="";
    var cont=0;
    $.ajax({
        data: {"idProducto" : idproducto},
        type: "POST",
        dataType: "json",
        url: "assets/php/productos.php",
        beforeSend: function()
        {
            spinner.show();
            $('#modal-div').addClass('filter blur');
            modalBody.empty();
        }
    })
    .done(function( data, textStatus, jqXHR ) {
    if(data==null)
        modalBody.empty();
    data.forEach(element => 
    {
        var divBuyButton = document.getElementById('buy-button');
        divBuyButton.innerText='';
        
        var tablaModal = document.createElement('table');
        tablaModal.setAttribute('class','table-fixed text-sm md:text-lg')
        var tablaBody = document.createElement('tbody');
        /*tablaBody.setAttribute('class','align-baseline');*/
        var divImg = document.createElement('div');
        var divInfo = document.createElement('div');
        /*divImg.setAttribute('class','col-md-5');*/
        divImg.setAttribute('id','image-modal-product');
        /*divInfo.setAttribute('class','col-md-7');*/
        divInfo.setAttribute('id','info-modal-product');
        divImg.innerHTML='<img class="" src="assets/img/product/'+element.imagen+'.webp" alt="'+name+'">';
        for(var i in element)
        {
            if(i!='imagen')
            {
                if(i!='url_ml')
                {
                    if(i!='url_amz')
                    {
                        if(element[i]!='')
                        {
                            if(i=='capacidad')
                            {
                                aux=aux+'<tr class="text-left align-top"><td class="font-extrabold w-1/5 uppercase">'+heading[cont]+'</td><td class="w-4/5">'+element[i]+' LT</td></tr><tr><td>';
                            }
                            else if((i.includes('alto')||i.includes('ancho')||i.includes('largo')||i.includes('diametro'))&&element[i]!='')
                            {
                                aux=aux+'<tr class="text-left align-top"><td class="font-extrabold w-1/5 uppercase">'+heading[cont]+'</td><td class="w-4/5">'+element[i]+' cm</td></tr><tr><td>';
                            }
                            else
                                aux=aux+'<tr class="text-left align-top"><td class="font-extrabold w-1/5 uppercase">'+heading[cont]+'</td><td class="w-4/5">'+element[i]+'</td></tr><tr><td>';
                        }
                        cont+=1;
                    }
                }
            }
        }
        if((element.url_ml!=null && element.url_ml!='') || (element.url_amz!=null && element.url_amz!=''))
        {
            divBuyButton.innerHTML="<div class='col-span-2'>O bien, puedes adquirirlo en:</div>";
            if(element.url_ml!=null && element.url_ml!='')
            {
                var ml_button = document.createElement('div');
                ml_button.setAttribute('class','col-span-1');
                ml_button.innerHTML="<a href="+element.url_ml+" class='items-center justify-items-center button bg-yellow-400 transition hover:bg-yellow-500 duration-200 ease-in-out rounded-lg'><img src='assets/img/portfolio/mercadolibre-icon.webp'></a>";
                (divBuyButton.lastElementChild).parentNode.insertBefore(ml_button, (divBuyButton.lastElementChild).nextSibling);
            }
            if(element.url_amz!=null && element.url_amz!='')
            {
                var amz_button = document.createElement('div');
                amz_button.setAttribute('class','col-span-1');
                amz_button.innerHTML="<a href="+element.url_amz+" class='items-center justify-items-center button bg-yellow-400 transition hover:bg-yellow-500 duration-200 ease-in-out rounded-lg'><img src='assets/img/portfolio/amazon-icon.webp'></a>";
                (divBuyButton.lastElementChild).parentNode.insertBefore(amz_button, (divBuyButton.lastElementChild).nextSibling);
            }
        }
        tablaBody.innerHTML=aux;
        tablaModal.appendChild(tablaBody);
        divInfo.appendChild(tablaModal);
        var rowModal = document.getElementById('row-modal');
        rowModal.appendChild(divImg);
        rowModal.appendChild(divInfo);
        $('#modal-div').removeClass('filter blur');

        spinner.hide();
    });
    })
    .fail(function( jqXHR, textStatus, errorThrown ) {
        if ( console && console.log ) {
            console.log( "La solicitud a fallado: " +  textStatus + errorThrown);
        }
    });
    closeBtn.onclick = function()
    {
        modal.classList.toggle("hidden");
        layout.classList.toggle("hidden");
        $(window).scrollTop(windowHeight);
        /*enableScroll();*/
    }
    okBtn.onclick = function()
    {
        modal.classList.toggle("hidden");
        layout.classList.toggle("hidden");
        /*enableScroll();*/
        $(window).scrollTop(windowHeight);
    }
    /*disableScroll();*/
}
const btn = document.querySelector("button.mobile-menu-button");
const menu = document.querySelector(".mobile-menu");
btn.addEventListener("click", () => {
    menu.classList.toggle("hidden");
});