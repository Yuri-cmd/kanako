<?php
$conexion = (new Conexion())->getConexion();

$datoEmpresa = $conexion->query("select * from empresas where id_empresa='{$_SESSION['id_empresa']}'")->fetch_assoc();

$igv_empresa = $datoEmpresa['igv'];

?>
<div class="page-title-box">
    <div class="row align-items-center">
        <div class="col-md-8">
            <h6 class="page-title">Ventas</h6>
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="javascript: void(0);">Facturación</a></li>
                <li class="breadcrumb-item"><a href="/ventas" class="button-link">Ventas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Productos</li>
            </ol>
        </div>
        <div class="col-md-4">
            <div class="float-end d-none d-md-block">
                <button id="backbuttonvp" href="/ventas" type="button" class="btn btn-warning button-link"><i class="fa fa-arrow-left"></i> Regresar</button>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="fecha-app" value="<?= date("Y-m-d") ?>">
<?php
if (isset($_GET["coti"])) {
    echo "<input type='hidden' id='cotizacion' value='{$_GET["coti"]}'>";
}
?>
<div class="row" id="container-vue">
    <div class="col-12 row">
        <div class="col-md-8">
            <div class="card ">
                <div class="card-body">

                    <h4 class="card-title">Venta de Productos</h4>

                    <div class="card-title-desc">

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <form v-on:submit.prevent="addProduct" class="form-horizontal">

                                <div hidden class="form-group row mb-3">
                                    <label class="col-lg-2 control-label">Almacén</label>
                                    <div class="col-lg-3">
                                        <select class="form-control idAlmacen" v-model='producto.almacen' @change="onChangeAlmacen($event)">
                                            <option value="1">Almacén 1</option>
                                            <option value="2">Tienda 1</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row mb-3">
                                    <label class="col-lg-2 control-label">Buscar</label>
                                    <div class="col-lg-10">

                                        <div class="input-group">
                                            <input @input="chambioInputSearchProd" type="text" placeholder="Consultar Productos" class="form-control ui-autocomplete-input" id="input_buscar_productos" autocomplete="off">
                                            <div class="input-group-btn p-1">
                                                <label class=""> <input v-model="usar_scaner" type="checkbox">  Usar Scaner</label><br/>
                                                <label @click="abrirMultipleBusaque" style="color: blue;cursor: pointer">Busqueda Multiple</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row mb-3">
                                    <label class="col-lg-2 control-label">Descripción</label>
                                    <div class="col-lg-10">
                                        <input required v-model="producto.descripcion" type="text" placeholder="Descripción" class="form-control" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="row" style="margin-right: 0;">
                                        <div class="row  col-lg-4">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Stock Actual</label>
                                            <div class="col-sm-6">
                                                <input disabled v-model="producto.stock" class="form-control text-center" type="text" placeholder="0">
                                            </div>
                                        </div>
                                        <div class="row  col-lg-4">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Cantidad</label>
                                            <div class="col-sm-6">
                                                <input @keypress="onlyNumber" required v-model="producto.cantidad" class="form-control text-center" type="text" placeholder="0" id="example-text-input">
                                            </div>
                                        </div>
                                        <div class="row  col-lg-3">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Precio</label>
                                            <div class="col-sm-8">
                                                <select name="" id="" class="form-control" v-model="producto.precio_unidad">
                                                    <option v-for="(value, key) in precioProductos" :value="value.precio" :key="key">{{ value.precio }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <button id="submit-a-product" type="submit" class="btn btn-success"><i class="fa fa-check"></i> Agregar
                                        </div>
                                    </div>

                                </div>


                            </form>
                        </div>

                        <div class="col-md-12 mt-5">
                            <div class="row">
                                <div class="text-left col-md-9">
                                    <h4>Detalle Venta</h4>
                                </div>
                                <div class="col-md-3" v-if="productos.length > 0">
                                    <label for="">Usar</label>
                                    <select name="" id="" class="form-control text-right" v-model="usar_precio" @change="cambiarPrecio($event)">
                                        <option value="1">Precio 1</option>
                                        <option value="2">Precio 2</option>
                                        <option value="3">Precio 3: Dolar </option>
                                        <option value="4">Precio Club</option>
                                        <option value="5">Precio Unidad</option>
                                    </select>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Item</th>
                                        <th>Producto</th>
                                        <th>Cantidad</th>
                                        <th>P. Unit.</th>
                                        <th>Parcial</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item,index) in productos">
                                        <td>{{index+1}}</td>
                                        <td>{{item.descripcion}}</td>
                                        <td><span v-if="!item.edicion" >{{item.cantidad}}</span><input  v-if="item.edicion" v-model="item.cantidad"></td>
                                        <td><span v-if="!item.edicion" >{{item.precioVenta}}</span><input v-if="item.edicion" v-model="item.precioVenta"></td>
                                        <td>{{item.precioVenta*item.cantidad}}</td>
                                        <td><button @click="eliminarItemPro(index)" type="button" class="btn btn-danger btn-sm">
                                                <i class="fa fa-times"></i>
                                            </button>
                                            <button v-if="!item.edicion" @click="item.edicion=true" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></button>
                                            <button v-if="item.edicion" @click="item.edicion=false" class="btn btn-warning btn-sm"><i class="fa fa-save"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="card ">
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="widget padding-0 white-bg">
                            <div class="padding-20 text-center">
                                <form v-on:submit.prevent role="form" class="form-horizontal">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <label class="control-label">Aplicar IGV Venta</label>
                                            <select :disabled="!apli_igv_is" v-model="venta.apli_igv" class="form-control">
                                                <option value="1">SI</option>
                                                <option value="0">NO</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Documento</label>
                                            <div class="col-md-12">
                                                <select @change="onChangeTiDoc($event)" v-model="venta.tipo_doc" class="form-control">
                                                    <option value="1">BOLETA DE VENTA</option>
                                                    <option value="2">FACTURA</option>
                                                    <option value="6">NOTA DE VENTA</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="control-label">Tipo Pago</label>
                                            <select v-model="venta.tipo_pago" @change="changeTipoPago" class="form-control">
                                                <option value="1">Contado</option>
                                                <option value="2">Crédito</option>
                                            </select>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label class="control-label">Método Pago</label>
                                            <select class="form-control" v-model='venta.metodo'>
                                                <option v-for="(value, key) in metodosPago" :value="value.id_metodo_pago" :key="key">{{ value.nombre }}</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label">Ser | Num</label>
                                        <div class="col-lg-12 row">
                                            <div class="col-lg-6">
                                                <input v-model="venta.serie" type="text" class="form-control text-center" readonly="">
                                            </div>
                                            <div class="col-lg-6">
                                                <input v-model="venta.numero" type="text" class="form-control text-center" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <label class="col-lg-4 control-label"> </label>
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Moneda</label>
                                                        <div class="col-lg-12">
                                                            <select v-model="venta.moneda" class="form-control">
                                                                <option value="1">SOLES</option>
                                                                <option value="2">DOLARES</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Tasa de cambio</label>
                                                        <div class="col-lg-12">
                                                            <input  v-model="venta.tc" type="text"  >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <label class="col-lg-4 control-label">Fecha</label>
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Emisión</label>
                                                        <div class="col-lg-12">
                                                            <input v-model="venta.fecha" type="date" placeholder="dd/mm/aaaa" name="input_fecha" class="form-control text-center" value="2021-10-16">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Vencimiento</label>
                                                        <div class="col-lg-12">
                                                            <input disabled v-model="venta.fechaVen" type="date" placeholder="dd/mm/aaaa" name="input_fecha" class="form-control text-center" value="2021-10-16">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-if="venta.tipo_pago=='2'" class="form-group ">
                                        <label class="control-label">Días de pago</label>
                                        <div class="col-lg-12">
                                            <input @focus="focusDiasPagos" v-model="venta.dias_pago" type="text" class="form-control text-center">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label">Cliente</label>
                                    </div>

                                    <div class="form-group mb-3">
                                        <div class="col-lg-12">
                                            <div class="input-group">

                                                <input id="input_datos_cliente" v-model="venta.num_doc" type="text" placeholder="Ingrese Documento" class="form-control" maxlength="11">
                                                <div class="input-group-prepend">
                                                    <button @click="buscarDocumentSS" class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <div class="col-lg-12">
                                            <input v-model="venta.nom_cli" type="text" placeholder="Nombre del cliente" class="form-control ui-autocomplete-input" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <div class="col-lg-12">
                                            <div class="input-group">
                                                <input v-model="venta.dir_cli" type="text" placeholder="Dirección 1" class="form-control ui-autocomplete-input" autocomplete="off">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <input v-model="venta.dir_pos" name="dirserl" value="1" type="radio" class="form-check-input">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <div class="col-lg-12">
                                            <div class="input-group">
                                                <input v-model="venta.dir2_cli" type="text" placeholder="Dirección 2" class="form-control ui-autocomplete-input" autocomplete="off">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">
                                                        <input :disabled="!isDirreccionCont" v-model="venta.dir_pos" name="dirserl" value="2" type="radio" class="form-check-input">
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">
                                        <div class="col-lg-12">
                                            <label>Observaciones</label>
                                            <div class="input-group">

                                                <input v-model="venta.observ" type="text" placeholder="" class="form-control ui-autocomplete-input" autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group  mb-3">

                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Paga con</label>
                                                        <div class="col-lg-12">
                                                            <input v-model="venta.pagacon" @keypress="onlyNumber" type="text" placeholder=""  class="form-control text-center" >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label class="control-label">Vuelto</label>
                                                        <div class="col-lg-12">
                                                            <input :value="vuelDelPago" disabled  type="text"    class="form-control text-center" >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group  mb-3">
                                        <label><input v-model="venta.segundoPago" type="checkbox"> Habilitar Segundo Pago</label>
                                    </div>
                                    <div v-if="venta.segundoPago" class="col-md-12 form-group">
                                        <label class="control-label">Método Pago</label>
                                        <select class="form-control" v-model='venta.metodo2'>
                                            <option v-for="(value, key) in metodosPago" :value="value.id_metodo_pago" :key="key">{{ value.nombre }}</option>
                                        </select>
                                    </div>
                                    <div v-if="venta.segundoPago" class="form-group  mb-3">

                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group ">
                                                        <label class="control-label">Monto de Paga</label>
                                                        <div class="col-lg-12">
                                                            <input v-model="venta.pagacon2" @keypress="onlyNumber" type="text" placeholder=""  class="form-control text-center" >
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group  mb-3">
                                        <div class="col-lg-12">
                                            <button @click="guardarVenta" type="button" class="btn btn-lg btn-primary" id="btn_finalizar_pedido">
                                                <i class="fa fa-save"></i> Guardar
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="bg-primary pv-15 text-center  p-3" style="height: 90px; color: white">
                                <h1 class="mv-0 font-400" id="lbl_suma_pedido">{{monedaSibol}} {{totalProdustos}}</h1>
                                <div class="text-uppercase">Suma Pedido</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>


    <div class="modal fade" id="modal-dias-pagos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Dias de Pagos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <div class="">
                                <label class="form-label">Fecha Emisión</label>
                                <input v-model="venta.fecha" disabled type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="">
                                <label class="form-label">Monto Total Venta</label>
                                <input :value="'S/ '+venta.total" disabled type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Días de pagos</label>
                        <input placeholder="10,20,30,........" v-model="venta.dias_pago" @keypress="onlyNumberComas" type="text" class="form-control">
                        <div class="form-text">Separar por comas los días de pagos</div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="text-center table-sm table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Fecha</th>
                                        <th>Monto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item,index) in venta.dias_lista">
                                        <td></td>
                                        <td>{{visualFechaSee(item.fecha)}}</td>
                                        <td>S/ {{formatoDecimal(item.monto)}}</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="2">Total</th>
                                        <th>{{totalValorListaDias}}</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalImprimirComprobante" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Imprimir Comprobante</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <button id="ce-t-a4" class="print-pfd-sld mt-2 btn btn-primary"><i class="fa fa-file-pdf"></i> Hoja A4</button>
                    <button id="ce-t-a4-m" class="print-pfd-sld mt-2 btn btn-primary"><i class="fa fa-file-pdf"></i> Media Hoja A4</button>
                    <button id="ce-t-8cm" class="print-pfd-sld mt-2 btn btn-info"><i class="fas fa-file-invoice"></i> Voucher 8cm</button>
                    <button id="ce-t-5_6cm" class="print-pfd-sld mt-2 btn btn-info"><i class="fas fa-file-invoice"></i> Voucher 5.8cm</button>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalSelMultiProd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered  modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Busqueda Multiple</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div v-if="pointSel==1">
                        <div class="mb-3">
                            <label class="form-label">Buscar Producto</label>
                            <input v-model="dataKey" @keyup="busquedaKeyPess" type="text" class="form-control" >
                        </div>

                        <div class="list-group" style=" height: 300px; overflow-y: scroll;">
                            <label v-for="item in listaTempProd"   class="list-group-item list-group-item-action"><input v-model="itemsLista" :value="item" type="checkbox"> {{item.value}}</label>
                        </div>
                        <div v-if="itemsLista.length>0" style="width: 100%" class="text-end">
                            <button @click="pasar2Poiter" class="btn btn-primary">Continuar</button>
                        </div>
                    </div>
                    <div v-if="pointSel==2">
                        <table class="table table-sm table-bordered">
                            <thead>
                            <tr>
                                <td>Producto</td>
                                <td>Stock</td>
                                <td>Cantidad</td>
                                <td>Precio</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="item in itemsLista">
                                <th>{{item.codigo_pp}} | {{item.descripcion}}</th>
                                <th>{{item.cnt}}</th>
                                <th><input style="width: 80px;" v-model="item.cantidad"/></th>
                                <th>
                                    <select  style="width: 80px;"  class="form-control" v-model="item.precio_unidad">
                                        <option v-for="(value, key) in item.precioProductos" :value="value.precio" :key="key">{{ value.precio }}</option>
                                    </select>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                        <div v-if="itemsLista.length>0" style="width: 100%" class="text-end">
                            <button @click="pointSel=1" class="btn btn-warning">Regresar</button>
                            <button @click="agregarProducto2Ps" class="btn btn-primary">Agregar</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


</div>



<script>
    /*   function modalFunsns(link,linkd,nameFile,num,email) {
        const html = `
        <div class="row text-start">
            <div class="col-md-12">
                <form id="from-sen-email" >
                <div class="form-group">
                    <label>Enviar Por Email</label>
                    <div class="input-group mb-3">
                        <input type="hidden" name="nombrefile" value="${nameFile}">
                        <input type="hidden" name="link" value="${linkd}">
                      <input value="${email}" required name="email" type="email" class="form-control" placeholder="ejemplo@gmail.com" >
                      <div class="input-group-prepend">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-send"></i> Enviar</button>
                      </div>
                    </div>
                </div>
                </form>

                <form id="from-sen-whatsapp" >

                <div class="form-group">
                    <label>Enviar a Whatsapp</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">+51 </span>
                         </div>
                      <input require name="num" value="${num}" type="text" class="form-control" placeholder="00000" >
                        <input type="hidden" name="link" value="${link}">
                      <div class="input-group-prepend">
                        <button class="btn btn-primary"><i class="fa fa-send"></i> Enviar</button>
                      </div>
                    </div>
                </div>
             </form>
            </div>
        </div>`;
        Swal.fire({
            title:"Enviar Factura",
            html,
            didOpen: () => {
                //Swal.showLoading()
                const formSendEmail = Swal.getHtmlContainer().querySelector('#from-sen-email');
                formSendEmail.addEventListener("submit",function (evt) {
                    evt.preventDefault();
                    $("#loader-menor").show();
                    _post("/ajs/send/comprobante/email",$(this).serialize(),
                        function (resp) {
                            console.log(resp);
                            if (resp.res){
                                alertExito("Enviado")
                            }else{
                                alertAdvertencia("No se pudo Enviar")
                            }
                        });
                });
                const formSendWatsapp = Swal.getHtmlContainer().querySelector('#from-sen-whatsapp');
                formSendWatsapp.addEventListener("submit",function (evt) {
                    evt.preventDefault();
                    const numero = $(this).find("input[name='num']").val();
                    const linkVen = $(this).find("input[name='link']").val();

                    var link = "https://api.whatsapp.com/send?phone=";
                    const cod_ = 51;
                    const number_ = numero;
                    const mensaje = linkVen;
                    if (number_.length > 0) {
                        link += cod_ + number_
                        if (mensaje.length > 0) {
                            link += "&text=" + encodeURIComponent(mensaje)
                        }
                    }
                    window.open(link);
                  
                });
                console.log(formSendEmail);
            },
        })
        setTimeout(function (){},100)
    } */
    $(document).ready(function() {

        console.log($('.idAlmacen').val());

        const app = new Vue({
            el: "#container-vue",
            data: {
                usar_scaner:false,
                apli_igv_is: true,
                producto: {
                    edicion:false,
                    productoid: "",
                    descripcion: "",
                    nom_prod: "",
                    cantidad: "",
                    stock: "",
                    codigo: "",
                    costo: "",
                    codsunat: "",
                    precio: '',
                    almacen: '2',
                    precio2: '',
                    precio3: '',
                    precio4: '',
                    precio_unidad: '',
                    precioVenta: '',
                    precio_usado: 1
                },
                usar_precio: '5',
                productos: [],
                metodosPago: [],
                precioProductos: [],
                venta: {
                    segundoPago:false,
                    pagacon2:'',
                    pagacon:'',
                    observ: '',
                    apli_igv: 1,
                    dir_pos: 1,
                    tipo_doc: '6',
                    serie: '',
                    numero: '',
                    tipo_pago: '1',
                    dias_pago: '',
                    fecha: $("#fecha-app").val(),
                    fechaVen: $("#fecha-app").val(),
                    sendwp: false,
                    numwp: "",
                    num_doc: "",
                    nom_cli: "",
                    dir_cli: "",
                    dir2_cli: "",
                    tipoventa: 1,
                    total: 0,
                    dias_lista: [],
                    metodo: 12,
                    metodo2: 12,
                    moneda:1,
                    tc:'',
                },
                dataKey:'',
                listaTempProd:[],
                itemsLista:[],
                pointSel:1
            },
            watch: {
                'venta.dias_pago'(newValue) {
                    const listD = (newValue + "").split(",");
                    this.dias_lista = [];
                    if (listD.length > 0) {

                        var listaTemp = listD.filter(ite => ite.length > 0)
                        const palorInicial = (parseFloat(this.venta.total + "") / listaTemp.length).toFixed(0)
                        var totalValos = parseFloat(this.venta.total + "");
                        listaTemp = listaTemp.map((num, index) => {
                            var fecha_ = new Date(this.venta.fecha)
                            const dias_ = parseInt(num + "")
                            fecha_.setDate(fecha_.getDate() + dias_);
                            var value = 0;
                            if (index + 1 == listaTemp.length) {
                                value = totalValos;
                                this.venta.fechaVen = this.formatDate(fecha_)
                            } else {
                                value = palorInicial;
                                totalValos -= palorInicial;
                            }
                            return {
                                fecha: this.formatDate(fecha_),
                                monto: value
                            }
                        });
                        //console.log(palorInicial+"<<<<<<<<<<<<<")
                        this.venta.dias_lista = listaTemp
                        //console.log(listaTemp);
                    }

                }
            },
            methods: {
                agregarProducto2Ps(){
                    this.pointSel=1
                    this.productos=this.productos.concat(this.itemsLista.map(e=>{
                        e.precioVenta = e.precio_unidad
                        e.edicion = false
                        return {...e,precioVenta:e.precio_unidad,edicion:false,productoid:e.codigo}
                    }))
                    this.itemsLista=[]
                    this.listaTempProd=[]
                    this.dataKey=''
                    $("#modalSelMultiProd").modal('hide')
                },
                pasar2Poiter(){
                    this.itemsLista = this.itemsLista.map(e=>{
                        e.cantidad='1'
                        let array = [{
                            precio: e.precio
                        },
                            {
                                precio: e.precio2
                            },
                            {
                                precio: e.precio3
                            },
                            {
                                precio: e.precio4
                            },
                            {
                                precio: e.precio_unidad
                            }
                        ]
                        e.precio_unidad=array[array.length-1].precio||0
                        e.precioProductos = array
                        return e
                    })
                    this.pointSel=2
                },
                busquedaKeyPess(evt){
                    const vue=this
                    vue.listaTempProd=[]
                    if (this.dataKey.length>0){
                        _get("/ajs/cargar/productos/2?term="+this.dataKey,(result)=>{
                            console.log(result)
                            vue.listaTempProd = result
                        })
                    }

                },
                abrirMultipleBusaque(){
                    $("#modalSelMultiProd").modal('show')
                },
                chambioInputSearchProd(){
                    const codInput=$("#input_buscar_productos").val().trim();
                    if (this.usar_scaner){
                        if (codInput.length>3){
                            _post("/ajs/data/producto/info/code",
                                    {code:codInput,almacen:this.producto.almacen},
                                    function(resp){
                                        console.log(resp.data);
                                        if(resp.res){
                                            const ui={item:resp.data}
                                            app.producto.productoid = ui.item.codigo
                                            app.producto.descripcion = ui.item.codigo + " | " + ui.item.descripcion
                                            app.producto.nom_prod = ui.item.descripcion
                                            app.producto.cantidad = ''
                                            app.producto.stock = ui.item.cantidad
                                            app.producto.precio = ui.item.precio == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio + "").toFixed(4)
                                            app.producto.precio2 = ui.item.precio2 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio2 + "").toFixed(4)
                                            app.producto.precio3 = ui.item.precio3 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio3 + "").toFixed(4)
                                            app.producto.precio4 = ui.item.precio4 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio4 + "").toFixed(4)
                                            app.producto.precio_unidad = ui.item.precio_unidad == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio_unidad + "").toFixed(4)
                                            app.producto.precioVenta = parseFloat(ui.item.precio_unidad + "").toFixed(4)
                                            app.producto.codigo = ui.item.codigo
                                            app.producto.costo = ui.item.costo
                                            let array = [{
                                                precio: app.producto.precio
                                            },
                                                {
                                                    precio: app.producto.precio2
                                                },
                                                {
                                                    precio: app.producto.precio3
                                                },
                                                {
                                                    precio: app.producto.precio4
                                                },
                                                {
                                                    precio: app.producto.precio_unidad
                                                }
                                            ]

                                            app.precioProductos = array
                                            $("#input_buscar_productos").val('')
                                        }else{
                                            //alertAdvertencia("No se encontro algun producto con el codigo: "+$("#input_buscar_productos").val())
                                            $("#input_buscar_productos").val('')
                                        }
                                    }
                                )
                        }
                    }
                },
                cambiarPrecio(event) {
                    console.log(event.target.value)

                    var self = this

                    this.productos.forEach(element => {
                        if (event.target.value == 1) {
                            element.precioVenta = element.precio
                            /*  ui.item.precio == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio + "").toFixed(2) */
                            element.precio_usado = '1'
                        } else if (event.target.value == 2) {
                            element.precioVenta = element.precio2
                            element.precio_usado = '2'
                        } else if (event.target.value == 3) {
                            element.precioVenta = element.precio3
                            element.precio_usado = '3'

                        } else if (event.target.value == 4) {
                            element.precioVenta = element.precio4
                            element.precio_usado = '4'
                        } else {
                            element.precioVenta = element.precio_unidad
                            element.precio_usado = '5'
                        }

                    });
                },
                buscarPorCodigoBarra() {

                },
                cargarCotizacion() {
                    const vue = this;
                    _post("/ajs/cotizaciones/info", {
                            coti: $("#cotizacion").val()
                        },
                        function(resp) {
                            console.log(resp);
                            vue.productos = resp.productos.map(ert=>{
                                ert.descripcion = ert.codigo.toString().trim()+' | '+ert.descripcion
                                return ert
                            })
                            //vue.venta.fecha = resp.fecha
                            vue.venta.cotiId = resp.cotizacion_id
                            vue.venta.moneda = resp.moneda
                            vue.venta.tc = resp.cm_tc
                            vue.venta.tipo_doc = resp.id_tido
                            vue.venta.tipo_pago = resp.id_tipo_pago
                            vue.venta.dias_pago = resp.dias_pagos
                            vue.venta.dir_pos = parseInt(resp.direccion + "")
                            vue.venta.num_doc = resp.cliente_doc
                            vue.venta.nom_cli = resp.cliente_nom
                            vue.venta.dir_cli = resp.cliente_dir1
                            vue.venta.dir2_cli = resp.cliente_dir2
                            /*   vue.venta.cotizacion = $('#cotizacion').val() */
                            vue.usar_precio = resp.usar_precio
                            setTimeout(function() {
                                vue.venta.dias_lista = resp.cuotas
                            }, 1000)


                        }
                    )
                },
                formatoDecimal(num, desc = 2) {
                    return parseFloat(num + "").toFixed(desc);
                },
                visualFechaSee(fecha) {
                    return formatFechaVisual(fecha);
                },
                formatDate(date) {
                    console.log(date);
                    var d = date,
                        month = '' + (d.getMonth() + 1),
                        day = '' + (d.getDate() + 1),
                        year = d.getFullYear();

                    if (month.length < 2)
                        month = '0' + month;
                    if (day.length < 2)
                        day = '0' + day;

                    return [year, month, day].join('-');
                },
                onlyNumberComas($event) {
                    //console.log($event.keyCode); //keyCodes value
                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                    if ((keyCode < 48 || keyCode > 57) && keyCode !== 44) { // 46 is dot
                        $event.preventDefault();
                    }
                },
                focusDiasPagos() {
                    //console.log("1000000000000000000")
                    $("#modal-dias-pagos").modal("show")
                },
                changeTipoPago(event) {
                    console.log(event.target.value)
                    this.venta.fechaVen = this.venta.fecha;
                    this.venta.dias_lista = []
                    this.venta.dias_pago = ''
                },
                onChangeAlmacen(event) {
                    /*    window.localStorage.removeItem('idChecks'); */
                    console.log(event.target.value)
                    this.producto.almacen = event.target.value
                    var self = this
                    $("#input_buscar_productos").autocomplete({

                        source: _URL + `/ajs/cargar/productos/${self.producto.almacen}`,
                        minLength: 1,
                        select: function(event, ui) {
                            event.preventDefault();
                            /*    console.log(item);
                               console.log(ui); */
                            console.log(ui.item);
                            /*   return */
                            app.producto.productoid = ui.item.codigo
                            app.producto.descripcion = ui.item.codigo + " | " + ui.item.descripcion
                            app.producto.nom_prod = ui.item.descripcion
                            app.producto.cantidad = ''
                            app.producto.stock = ui.item.cnt
                            app.producto.precio = ui.item.precio == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio + "").toFixed(4)
                            app.producto.precio2 = ui.item.precio2 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio2 + "").toFixed(4)
                            app.producto.precio3 = ui.item.precio3 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio3 + "").toFixed(4)
                            app.producto.precio4 = ui.item.precio4 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio4 + "").toFixed(4)
                            app.producto.precio_unidad = ui.item.precio_unidad == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio_unidad + "").toFixed(4)
                            app.producto.codigo = ui.item.codigo
                            app.producto.costo = ui.item.costo
                            app.producto.precioVenta = ui.item.precio_unidad == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio_unidad + "").toFixed(2)
                            let array = [{
                                    precio: app.producto.precio
                                },
                                {
                                    precio: app.producto.precio2
                                },
                                {
                                    precio: app.producto.precio3
                                },
                                {
                                    precio: app.producto.precio4
                                },
                                {
                                    precio: app.producto.precio_unidad
                                }
                            ]

                            app.precioProductos = array
                            console.log(array);
                            $('#input_buscar_productos').val("");
                            $("#example-text-input").focus()
                        }
                    });
                },
                onlyNumber($event) {
                    //console.log($event.keyCode); //keyCodes value
                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                        $event.preventDefault();
                    }
                },
                eliminarItemPro(index) {
                    this.productos.splice(index, 1)
                    /*  this.producto.almacen = 1 */
                },
                buscarDocumentSS() {
                    if (this.venta.num_doc.length == 8 || this.venta.num_doc.length == 11) {
                        $("#loader-menor").show()
                        this.venta.dir_pos = 1
                        _ajax("/ajs/consulta/doc/cliente", "POST", {
                                doc: this.venta.num_doc
                            },
                            function(resp) {
                                $("#loader-menor").hide()
                                console.log(resp);
                                if (resp.res) {
                                    app._data.venta.nom_cli = (resp.data.nombre ? resp.data.nombre : '') + (resp.data.razon_social ? resp.data.razon_social : '')
                                    if (typeof resp.data.direccion !== 'undefined') {
                                        app._data.venta.dir_cli = resp.data.direccion.trim().length > 0 ? resp.data.direccion : '-'
                                    }

                                } else {
                                    alertAdvertencia("Documento no enocntrado")
                                }
                            }
                        )
                    } else {
                        alertAdvertencia("Documento, DNI es 8 digitos y RUC 11 digitos")
                    }
                },
                guardarVenta() {
                    if (this.productos.length > 0) {

                        var continuar = true;
                        var mensaje = '';



                        if (this.venta.tipo_doc == '1') {
                            if (this.venta.num_doc.length == 11) {
                                continuar = false;
                                mensaje = 'No puede emitir Boleta usando RUC';
                            }
                            if (this.venta.tipo_pago == 2) {
                                if (this.venta.dias_lista.length == 0) {
                                    continuar = false;
                                    mensaje = 'Debe especificar los días de pagos para un venta a crédito';
                                }
                            }
                        } else if (this.venta.tipo_doc == '2') {
                            if (this.venta.nom_cli.length < 5) {
                                mensaje = 'Debe escribir la Razón Social o dar al botón para buscar el ruc';
                                continuar = false;
                            }
                            if (this.venta.num_doc.length != 11) {
                                mensaje = 'Solo se puede emitir Factura usando RUC';
                                continuar = false;
                            }

                            if (this.venta.tipo_pago == 2) {
                                if (this.venta.dias_lista.length == 0) {
                                    continuar = false;
                                    mensaje = 'Debe especificar los días de pagos para un venta a crédito';
                                }
                            }


                        }

                        /*                    console.log(continuar);  */
                        if (continuar) {
                            if (this.venta.total > 0) {
                                const data = {
                                    ...this.venta,
                                    listaPro: JSON.stringify(this.productos),
                                    datosGuiaRemosion: localStorage.getItem('datosGuiaRemosion'),
                                    datosTransporteGuiaRemosion: localStorage.getItem('datosTransporteGuiaRemosion'),
                                    productosGuiaRemosion: localStorage.getItem('productosGuiaRemosion'),
                                    datosUbigeoGuiaRemosion: localStorage.getItem('datosUbigeoGuiaRemosion'),

                                }
                                data.dias_lista = JSON.stringify(data.dias_lista)
                                /*console.log(data);
                                return*/
                                /*  console.log(data); */
                                /*  return */
                                /*  return */
                                /* console.log('linea 775'); */
                                /*  $("#loader-menor").show(); */
                                _ajax("/ajs/ventas/add", "POST",
                                    data,
                                    function(resp) {
                                        console.log(resp);

                                        let desde = localStorage.getItem('desde')
                                        /*  let dataGuia = JSON.parse(localStorage.getItem('datosGuiaRemosion'))
                                         dataGuia = JSON.parse(dataGuia) */
                                        /*   return */
                                        if (resp.res) {

                                            /*   console.log(resp);
                                              return */
                                            alertExito("Exito", "Venta Guardada").then(function() {
                                                       $("#ce-t-a4").attr("href", _URL + "/venta/comprobante/pdf/" + resp.venta + "/" + resp.nomxml);
                                                      $("#ce-t-a4-m").attr("href", _URL + "/venta/comprobante/pdf/ma4/" + resp.venta + "/" + resp.nomxml);
                                                      $("#ce-t-8cm").attr("href", _URL + "/venta/pdf/voucher/8cm/" + resp.venta + "/" + resp.nomxml);
                                                      $("#ce-t-5_6cm").attr("href", _URL + "/venta/pdf/voucher/5.6cm/" + resp.venta + "/" + resp.nomxml);
                                                      $("#modalImprimirComprobante").modal("show");

                                                })
                                                .then(function() {
                                                    //location.reload();
                                                })

                                            if (desde == 'coti_guia') {
                                                let idVenta = {
                                                    idVenta: resp.venta
                                                }
                                                data.idVenta = resp.venta
                                                _ajax("/ajs/guia/remision/add2", "POST", {
                                                        data
                                                    },
                                                    function(resp) {
                                                        console.log(resp);
                                                        localStorage.removeItem("desde");
                                                        localStorage.removeItem("datosGuiaRemosion");
                                                        localStorage.removeItem("datosTransporteGuiaRemosion");
                                                        localStorage.removeItem("productosGuiaRemosion");
                                                        localStorage.removeItem("datosUbigeoGuiaRemosion");
                                                        $("#backbuttonvp").click();
                                                    }
                                                )
                                            }
                                        } else {
                                            alertAdvertencia("No se pudo Guardar la Venta")
                                        }
                                    }
                                )
                            } else {
                                alertAdvertencia('El monto debe ser mayor a 0')
                            }


                        } else {
                            alertAdvertencia(mensaje)
                        }
                    } else {
                        alertAdvertencia("No hay productos agregados a la lista ")
                    }

                },
                buscarSNdoc() {
                    _ajax("/ajs/consulta/sn", "POST", {
                            doc: this.venta.tipo_doc
                        },
                        function(resp) {
                            app.venta.serie = resp.serie
                            app.venta.numero = resp.numero
                        }
                    )
                },
                onChangeTiDoc(event) {
                    this.buscarSNdoc();
                    if (this.venta.tipo_doc == 6) {
                        this.apli_igv_is = false
                        this.venta.apli_igv = 1
                    } else {
                        this.apli_igv_is = true;
                    }
                },
                limpiasDatos() {
                    this.producto = {
                        edicion:false,
                        productoid: "",
                        descripcion: "",
                        nom_prod: "",
                        cantidad: "",
                        stock: "",
                        codigo: "",
                        costo: "",
                        codsunat: "",
                        precio: '',
                        almacen: '2',
                        precio2: '',
                        precio3: '',
                        precio4: '',
                        precio_unidad: '',
                        precioVenta: '',
                        precio_usado: 1
                    }
                },
                addProduct() {
                    //if (this.producto.stock)
                    if (this.producto.descripcion.length > 0) {
                        const prod = {
                            ...this.producto
                        }
                        this.productos.push(prod)
                        this.limpiasDatos();
                        this.usar_precio = 5
                    } else {
                        alertAdvertencia("Busque un producto primero")
                            .then(function() {
                                setTimeout(function() {
                                    $("#input_buscar_productos").focus();
                                }, 500)
                            })
                    }

                }
            },
            computed: {
                monedaSibol(){
                    return (this.venta.moneda==1?'S/':'$')
                },
                vuelDelPago(){
                    if(this.venta.pagacon.length>0){
                        let pagacon= parseFloat(this.venta.pagacon)
                        if (this.venta.segundoPago){
                            pagacon=pagacon+(isNaN(parseFloat(this.venta.pagacon2))?0:parseFloat(this.venta.pagacon2))
                        }
                        return pagacon - parseFloat(this.totalProdustos)
                    }else{
                        return ''
                    }
                },
                totalValorListaDias() {
                    var total_ = 0;
                    this.venta.dias_lista.forEach((el) => {
                        total_ += parseFloat(el.monto + "")
                    })
                    return "S/ " + total_.toFixed(4);
                },
                isDirreccionCont() {
                    return this.venta.dir2_cli.length > 0;
                },
                totalProdustos() {
                    const vue =this
                    var total = 0;
                    this.productos.forEach(function(prod) {
                        if (vue.venta.moneda==2){
                            total += (prod.precioVenta/ parseFloat(vue.venta.tc||'1')) * prod.cantidad
                        }else{
                            total += prod.precioVenta * prod.cantidad
                        }

                    })

                    this.venta.total = total;
                    return  total.toFixed(4)
                }
            }
        });
        app.buscarSNdoc();

        _ajax("/ajs/consulta/metodo/pago", "POST", {

            },
            function(resp) {
                console.log(resp);
                app._data.metodosPago = resp
                /*     app.venta.serie = resp.serie
                    app.venta.numero = resp.numero */
            }
        )
        $("#input_datos_cliente").autocomplete({
            source: _URL + "/ajs/buscar/cliente/datos",
            minLength: 2,
            select: function(event, ui) {
                event.preventDefault();
                console.log(ui.item);
                app._data.venta.dir_pos = 1
                app._data.venta.nom_cli = ui.item.datos
                app._data.venta.num_doc = ui.item.documento
                app._data.venta.dir_cli = ui.item.direccion
                /*$('#input_datos_cliente').val(ui.item.datos);
                $('#input_documento_cliente').val(ui.item.documento);
                $('#input_datos_cliente').focus();*/
            }
        });

        /*      $("#input_buscar_productos").autocomplete({
                     source: function(request, response) {
                         $.ajax({
                                     url: _URL + "/ajs/cargar/productos",
                                     dataType: "json",
                                     data: {
                                         term: request.term,
                                         country_id: $("#country_id").val()
                                     },
                                     success: function(data) {

                                         select: function(event, ui) {
                                             response(data);
                                             console.log(data);
                                             return

                                             app.producto.productoid = data.item.codigo
                                             app.producto.descripcion = data.item.codigo + " | " + data.item.descripcion
                                             app.producto.nom_prod = data.item.descripcion
                                             app.producto.cantidad = ''
                                             app.producto.stock = data.item.cnt
                                             app.producto.precio = data.item.precio
                                             app.producto.codigo = data.item.codigo
                                             app.producto.costo = data.item.costo
                                             let array = [{
                                                     precio: data.item.precio
                                                 },
                                                 {
                                                     precio: data.item.precio2
                                                 },
                                                 {
                                                     precio: data.item.precio3
                                                 },
                                             ]

                                             app.precioProductos = array
                                             console.log(array);
                                             $('#input_buscar_productos').val("");

                                         }
                                     });
                             },
                             min_length: 3,
                             delay: 300
                     }); */
        $("#input_buscar_productos").autocomplete({

            source: _URL + `/ajs/cargar/productos/${app.producto.almacen}`,
            minLength: 1,
            select: function(event, ui) {
                event.preventDefault();
                /*    console.log(item);
                   console.log(ui); */
                console.log(ui.item);
                /*  return */
                app.producto.productoid = ui.item.codigo
                app.producto.descripcion = ui.item.codigo_pp + " | " + ui.item.descripcion
                app.producto.nom_prod = ui.item.descripcion
                app.producto.cantidad = ''
                app.producto.stock = ui.item.cnt
                app.producto.precio = ui.item.precio == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio + "").toFixed(4)
                app.producto.precio2 = ui.item.precio2 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio2 + "").toFixed(4)
                app.producto.precio3 = ui.item.precio3 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio3 + "").toFixed(4)
                app.producto.precio4 = ui.item.precio4 == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio4 + "").toFixed(4)
                app.producto.precio_unidad = ui.item.precio_unidad == null ? parseFloat(0 + "").toFixed(4) : parseFloat(ui.item.precio_unidad + "").toFixed(4)
                app.producto.precioVenta = parseFloat(ui.item.precio_unidad + "").toFixed(4)
                app.producto.codigo = ui.item.codigo
                app.producto.costo = ui.item.costo
                let array = [{
                        precio: app.producto.precio
                    },
                    {
                        precio: app.producto.precio2
                    },
                    {
                        precio: app.producto.precio3
                    },
                    {
                        precio: app.producto.precio4
                    },
                    {
                        precio: app.producto.precio_unidad
                    }
                ]

                app.precioProductos = array
                /*  app.precioProductos = array */
                console.log(array);
                $('#input_buscar_productos').val("");
                $("#example-text-input").focus()
            }
        });

        <?php
        if (isset($_GET["coti"])) {
            echo "app.cargarCotizacion();";
        }
        ?>
        $("#example-text-input").on('keypress',function(e) {
            if(e.which == 13) {
                $("#submit-a-product").click()
                $("#input_buscar_productos").focus()
            }
        });
        $("#container-vue").on("click", ".print-pfd-sld", function() {
            console.log("ssssssssssssssssssss")

            let printA4 = $(this).attr('href')
            if ($("#device-app").val() == 'desktop') {
                var iframe = document.createElement('iframe');
                iframe.style.display = "none";
                iframe.src = printA4;
                document.body.appendChild(iframe);
                iframe.contentWindow.focus();
                iframe.contentWindow.print();
                console.log(printA4);
            } else {
                window.open(printA4)
            }
        })

        $('#container-vue .modalImprimirComprobante').on('hidden.bs.modal', function(e) {
            location.reload();
        })

        $('#modalImprimirComprobante').on('hidden.bs.modal', function (e) {
            location.reload();
        })
    })
</script>
