/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//lista_f(tabla SQL,id_campo,texto_campo,where,elemento_html)
function llenaLista(tabla,id,texto,where,elemento){


	var lista;

	 $.ajax({
	        beforeSend: function (){
	        },
	        url:'soft_util_combos.do',
	        type:'POST',
	        async:false,
	        data:'tabla='+tabla+'&id='+id+'&texto='+texto+'&where='+where,
	        error: function (response){
	            alert('Se produjo un error : ');
	            console.log('error combos->', response);
	        },
	        success: function (data){	        		        	
	            lista =  data;
	            $('#'+elemento).html(lista);
	        }
	    })

	 return lista;
} 

function mensaje(msg,duracion,tipo){
    return Materialize.toast(msg, duracion,tipo); 
    //alert("funcion general");
}

