<div class="page-title-box">
    <div class="row align-items-center">
        <div class="col-md-8">
            <h6 class="page-title">Cotizacion</h6>
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="javascript: void(0);">Facturacion</a></li>
                <li class="breadcrumb-item"><a href="/ventas" class="button-link">Ventas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Productos</li>
            </ol>
        </div>
        <div class="col-md-4">
            <div class="float-end d-none d-md-block">

            </div>
        </div>
    </div>
</div>
<input type="hidden" value="<?= $coti ?>" id="cotizacion">
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title"></h4>

                <div class="card-title-desc">
                    <div class="col-lg-12 text-end">
                        <a hidden href="/ventas/productos?coti=<?= $coti ?>" class="btn btn-success button-link" id="btnVenta">Proceder a Vender</a>
                        <button type="button" onclick="$('#btn_finalizar_pedido').click()" class="btn btn-primary">
                            <i class="fa fa-plus "></i> Guardar Cotizacion
                        </button>

                        <a id="backbuttonvp" style="margin-left:25px;" href="/cotizaciones" class="btn btn-warning button-link"><i class="fa fa-arrow-left"></i> Regresar</a>
                    </div>
                </div>
                <div class="row" id="container-vue">
                    <div class="col-12 row">
                        <div class="col-md-8">
                            <div class="panel">
                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-12">

                                            <form v-on:submit.prevent="addProduct" class="form-horizontal">
                                                <div class="form-group row mb-3">
                                                    <label class="col-lg-2 control-label">Buscar</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" placeholder="Consultar Productos" class="form-control ui-autocomplete-input" id="input_buscar_productos" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="form-group row mb-3">
                                                    <label class="col-lg-2 control-label">Descripcion</label>
                                                    <div class="col-lg-10">
                                                        <input required v-model="producto.descripcion" type="text" placeholder="Descripcion" class="form-control" readonly="true">
                                                    </div>
                                                </div>
                                                <div class="form-group row  mb-3">

                                                    <label class="col-lg-2 control-label">Stock Actual</label>
                                                    <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="row  col-lg-3">
                                                                <div class="col-sm-12">
                                                                    <input disabled v-model="producto.stock" class="form-control text-center" type="text" placeholder="0">
                                                                </div>
                                                            </div>
                                                            <div class="row  col-lg-4">
                                                                <label for="example-text-input" class="col-sm-4  control-label">Cantidad</label>
                                                                <div class="col-sm-8">
                                                                    <input @keypress="onlyNumber" required v-model="producto.cantidad" class="form-control text-center" type="text" placeholder="0" id="example-text-input-cnt">
                                                                </div>
                                                            </div>
                                                            <div class="row  col-lg-3">
                                                                <label for="example-text-input" class="col-sm-4 col-form-label">Precio</label>
                                                                <div class="col-sm-8">
                                                                    <select name="" id="" class="form-control" v-model="producto.precio">
                                                                        <option v-for="(value, key) in precioProductos" :value="value.precio" :key="key">{{ value.precio }}</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col">
                                                                <button id="submit-a-product" type="submit" class="btn btn-success"><i class="fa fa-check"></i> Agregar
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>


                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-9"></div>
                                            <div class="col-md-3" v-if="productos.length > 0">
                                                <label for="">Usar</label>
                                                <select name="" id="" class="form-control text-right" v-model="usar_precio" @change="cambiarPrecio($event)">
                                                    <option value="1">Precio 1</option>
                                                    <option value="2">Precio 2</option>
                                                    <option value="3">Precio 3</option>
                                                    <option value="4">Precio Club</option>
                                                    <option value="5">Precio Unidad</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="margin-top: 25px">
                                            <div class="form-group ">
                                                <div style="width: 100%; height: 20px; border-bottom: 2px solid #0866c6; text-align: left">
                                                    <span style="font-size: 16px; font-weight: bold ; background-color: #ffffff; padding: 1px 4px;">
                                                        Productos
                                                        <!--Padding is optional-->
                                                    </span>

                                                </div>
                                            </div>
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>Item</th>
                                                        <th>Codigo</th>
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
                                                        <td>{{item.codigo_pp}}</td>
                                                        <td>{{item.descripcion}}</td>
                                                        <td><input v-if="item.editable" v-model="item.cantidad">
                                                            <span  v-if="!item.editable">{{item.cantidad}}</span></td>
                                                        <td><input v-if="item.editable" v-model="item.precioVenta">
                                                            <span  v-if="!item.editable">{{item.precioVenta}}</span></td>
                                                        <td>{{item.precioVenta*item.cantidad}}</td>
                                                        <td>
                                                            <button @click="eliminarItemPro(index)" type="button" class="btn btn-danger btn-sm">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                            <button v-if="!item.editable" @click="item.editable=true" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></button>
                                                            <button v-if="item.editable" @click="item.editable=false" class="btn btn-warning btn-sm"><i class="fa fa-save"></i></button>
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
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label">Documento</label>
                                                            <div class="col-md-12">
                                                                <select @change="onChangeTiDoc($event)" v-model="venta.tipo_doc" class="form-control">
                                                                    <option value="1">BOLETA DE VENTA</option>
                                                                    <option value="2">FACTURA</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label">Tipo Pago</label>
                                                            <select v-model="venta.tipo_pago" @change="changeTipoPago" class="form-control">
                                                                <option value="1">Contado</option>
                                                                <option value="2">Credito</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div style="display: none" class="form-group">
                                                        <div class="col-lg-12 row">
                                                            <div class="col-lg-6">
                                                                <label class="text-center col-md-12">Serie</label>
                                                                <input v-model="venta.serie" type="text" class="form-control text-center" readonly="">
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <label class="text-center col-md-12">Numero</label>
                                                                <input v-model="venta.numero" type="text" class="form-control text-center" readonly="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group  mb-3">
                                                        <label style="display: none" class="col-lg-12 text-center">Fecha</label>
                                                        <div class="col-lg-12">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group ">
                                                                        <label class="control-label">Fecha</label>
                                                                        <div class="col-lg-12">
                                                                            <input v-model="venta.fecha" type="date" placeholder="dd/mm/aaaa" name="input_fecha" class="form-control text-center" value="2021-10-16">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" class="col-md-6">
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
                                                        <label class="control-label">Dias de pago</label>
                                                        <div class="col-lg-12">
                                                            <input @focus="focusDiasPagos" v-model="venta.dias_pago" type="text" class="form-control text-center">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-12 text-center">Cliente</label>
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <div class="col-lg-12">
                                                            <div class="input-group">
                                                                <input id="input_datos_cliente" v-model="venta.num_doc" type="text" placeholder="Ingrese Documento" class="form-control" maxlength="11">
                                                                <div class="input-group-addon btn btn-primary" @click="buscarDocumentSS" style="    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;">
                                                                    <i class="fa fa-search"></i>
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
                                                                <input v-model="venta.dir_cli" type="text" placeholder="Direccion 1" class="form-control ui-autocomplete-input" autocomplete="off">
                                                                <div class="input-group-addon"><input v-model="venta.dir_pos" name="dirserl" value="1" type="radio" class="form-check-input"></div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="form-group  mb-3">
                                                        <div class="col-lg-12">

                                                            <div class="input-group">
                                                                <input v-model="venta.dir2_cli" type="text" placeholder="Direccion 2" class="form-control ui-autocomplete-input" autocomplete="off">
                                                                <div class="input-group-addon">
                                                                    <input :disabled="!isDirreccionCont" v-model="venta.dir_pos" name="dirserl" value="2" type="radio" class="form-check-input">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="form-group  mb-3">
                                                        <div class="col-lg-12">
                                                            <button style="display: none" @click="guardarVenta" type="button" class="btn btn-lg btn-primary" id="btn_finalizar_pedido">
                                                                <i class="fa fa-save"></i> Guardar
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="bg-primary pv-15 text-center  p-3" style="height: 90px; color: white">
                                                <h1 class="mv-0 font-400" id="lbl_suma_pedido">S/ {{totalProdustos}}</h1>
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
                                    <h3 class="modal-title" id="exampleModalLabel">Dias de Pagos</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="">
                                                <label class="form-label">Fecha Emision</label>
                                                <input v-model="venta.fecha" disabled type="date" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="">
                                                <label class="form-label">Monto TotalVenta</label>
                                                <input :value="'S/ '+venta.total" disabled type="text" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Dias de pagos</label>
                                        <input placeholder="10,20,30,........" v-model="venta.dias_pago" @keypress="onlyNumberComas" type="text" class="form-control">
                                        <div class="form-text">Separe por comas los días de pagos</div>
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
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>

            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        const app = new Vue({
            el: "#container-vue",
            data: {
                producto: {
                    editable: false,
                    productoid: "",
                    descripcion: "",
                    nom_prod: "",
                    cantidad: "",
                    stock: "",
                    precio: "",
                    codigo: "",
                    costo: "",
                    codsunat: "",
                    precio: '1',
                    almacen: '1',
                    precio2: '',
                    precio3: '',
                    precio4: '',
                    precio_unidad: '',
                    precioVenta: '',
                    precio_usado: 1,
                    index: ''
                },
                productos: [],
                precioProductos: [],
                usar_precio: '1',
                venta: {
                    cotiId: '',
                    dir_pos: 1,
                    tipo_doc: '1',
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

                }
            },
            watch: {
                'venta.dias_pago': {
                    handler: function(newValue) {
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
                    },
                    deep: true
                }
            },
            methods: {
                cambiarPrecio(event) {
                    console.log(event.target.value)

                    var self = this

                    this.productos.forEach(element => {
                        if (event.target.value == 1) {
                            element.precioVenta = parseFloat(element.precio + "").toFixed(2)
                            /*  ui.item.precio == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio + "").toFixed(2) */
                            element.precio_usado = '1'
                        } else if (event.target.value == 2) {
                            element.precioVenta = parseFloat(element.precio2 + "").toFixed(2)
                            element.precio_usado = '2'
                        } else if (event.target.value == 3) {
                            element.precioVenta = parseFloat(element.precio3 + "").toFixed(2)
                            element.precio_usado = '3'

                        } else if (event.target.value == 4) {
                            element.precioVenta = parseFloat(element.precio4 + "").toFixed(2)
                            element.precio_usado = '4'
                        } else {
                            element.precioVenta = parseFloat(element.precio_unidad + "").toFixed(2)
                            element.precio_usado = '5'
                        }

                    });
                    self.usar_precio = event.target.value
                },
                cargarCotizacion() {
                    const vue = this;
                    _post("/ajs/cotizaciones/info", {
                            coti: $("#cotizacion").val()
                        },
                        function(resp) {
                            console.log(resp);
                            vue.productos = resp.productos.map(ee=>{
                                ee.editable=false;
                                return ee
                            })
                            vue.venta.fecha = resp.fecha
                            vue.venta.cotiId = resp.cotizacion_id
                            vue.venta.tipo_doc = resp.id_tido
                            vue.venta.tipo_pago = resp.id_tipo_pago
                            vue.venta.dias_pago = resp.dias_pagos
                            vue.venta.dir_pos = parseInt(resp.direccion + "")
                            vue.venta.num_doc = resp.cliente_doc
                            vue.venta.nom_cli = resp.cliente_nom
                            vue.venta.dir_cli = resp.cliente_dir1
                            vue.venta.dir2_cli = resp.cliente_dir2

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
                onlyNumber($event) {
                    //console.log($event.keyCode); //keyCodes value
                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                        $event.preventDefault();
                    }
                },
                eliminarItemPro(index) {
                    this.productos.splice(index, 1)
                },
                editarProd(index, i) {
                    /*   this.productos.splice(i, 1) */
                    /*   return */
                    /*  console.log(i); */
                    this.producto.index = i
                    var self = this
                    _ajax("/ajs/consulta/prod/coti", "POST", {
                            index
                        },
                        function(resp) {
                            $("#loader-menor").hide()
                            console.log(resp);
                            self.producto.descripcion = resp.id_producto + ' | ' + resp.descripcion
                            self.producto.stock = resp.cantidad
                            self.producto.cantidad = ''
                            self.producto.codigo = resp.id_producto
                            self.producto.productoid = resp.id_producto
                            self.producto.descripcion = resp.id_producto + ' | ' + resp.descripcion
                            self.producto.precio = parseFloat(resp.precio + "").toFixed(2)
                            self.producto.precio2 = parseFloat(resp.precio2 + "").toFixed(2)
                            self.producto.precio3 = parseFloat(resp.precio3 + "").toFixed(2)
                            self.producto.precioVenta = parseFloat(resp.precio + "").toFixed(2)
                            let array = [{
                                    precio: parseFloat(resp.precio + "").toFixed(2)
                                },
                                {
                                    precio: parseFloat(resp.precio2 + "").toFixed(2)
                                },
                                {
                                    precio: parseFloat(resp.precio3 + "").toFixed(2)
                                },
                            ]
                            self.precioProductos = array
                            /*  console.log(self.productos[i]); */
                        }
                    )
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
                                    app._data.venta.dir_cli = resp.data.direccion
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
                                    mensaje = 'Debe especificar los días de pagos para un cotizacion a crédito';
                                }
                            }
                        } else if (this.venta.tipo_doc == '2') {
                            mensaje = 'Solo se puede emitir Factura usando RUC';
                            if (this.venta.num_doc.length != 11) {
                                continuar = false;
                            }
                            if (this.venta.tipo_pago == 2) {
                                if (this.venta.dias_lista.length == 0) {
                                    continuar = false;
                                    mensaje = 'Debe especificar los días de pagos para un cotizacion a crédito';
                                }
                            }


                        }

                        if (continuar) {
                            //alertInfo("Proceso en construcción")
                            /*   console.log(this.usar_precio);
                              return */
                            const data = {
                                ...this.venta,
                                usar_precio: this.usar_precio,
                                listaPro: JSON.stringify(this.productos)
                            }
                            data.dias_lista = JSON.stringify(data.dias_lista)
                            /*  console.log(data);
                             return */
                            $("#loader-menor").show();
                            _ajax("/ajs/cotizaciones/edt", "POST",
                                data,
                                function(resp) {
                                    console.log(resp);
                                    if (resp.res) {
                                        alertExito("Exito", "Cotizacion Guardada")
                                            .then(function() {
                                                $("#btnVenta").click();
                                            })
                                    } else {
                                        alertAdvertencia("No se pudo Guardar la Cotizacion")
                                    }
                                }
                            )
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
                },
                limpiasDatos() {
                    this.producto = {
                        editable: false,
                        productoid: "",
                        descripcion: "",
                        nom_prod: "",
                        cantidad: "",
                        stock: "",
                        precio: "",
                        codigo: "",
                        costo: "",
                        codsunat: "",
                        precio: '1',
                        almacen: '1',
                        precio2: '',
                        precio3: '',
                        precio4: '',
                        precio_unidad: '',
                        precioVenta: '',
                        precio_usado: 1,
                        index: ''
                    }
                },
                addProduct() {
                    console.log(this.producto)
                    //if (this.producto.stock)
                    if (this.producto.descripcion.length > 0) {
                        const prod = {
                            editable: false,
                            ...this.producto
                        }
                        if (this.producto.index !== '') {
                            let id = this.producto.index
                            /*   let objIndex = this.productos[id].findIndex((obj => obj.index == id)); */
                            this.productos[id].cantidad = this.producto.cantidad
                            this.productos[id].codigo_pp = this.producto.codigo_pp
                            this.productos[id].codigo = this.producto.codigo
                            this.productos[id].descripcion = this.producto.descripcion
                            this.productos[id].precio = this.producto.precio
                            this.productos[id].precio2 = this.producto.precio2
                            this.productos[id].precio3 = this.producto.precio3
                            this.productos[id].precio3 = this.producto.precio3
                            this.productos[id].precioVenta = this.producto.precioVenta
                            this.productos[id].precio_usado = this.producto.precio_usado
                            this.productos[id].productoid = this.producto.productoid
                            this.productos[id].stock = this.producto.stock
                            console.log(this.productos[id]);
                        } else {
                            this.productos.push(prod)
                        }
                        /*  return */
                        this.precioProductos = []
                        this.limpiasDatos();
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
                totalValorListaDias() {
                    var total_ = 0;
                    this.venta.dias_lista.forEach((el) => {
                        total_ += parseFloat(el.monto + "")
                    })
                    return "S/ " + total_.toFixed(2);
                },
                isDirreccionCont() {
                    return this.venta.dir2_cli.length > 0;
                },
                totalProdustos() {
                    var total = 0;
                    this.productos.forEach(function(prod) {
                        total += prod.precioVenta * prod.cantidad
                    })
                    this.venta.total = total;
                    return total.toFixed(2);
                }
            }
        });
        app.buscarSNdoc();
        app.cargarCotizacion()
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
        $("#input_buscar_productos").autocomplete({

            source: _URL + `/ajs/cargar/productos/${app.producto.almacen}`,
            minLength: 1,
            select: function(event, ui) {
                event.preventDefault();
                /*    console.log(item);
                   console.log(ui); */
                console.log(ui.item);
                /*  return */
                console.log('entra aca');
                app.producto.productoid = ui.item.codigo
                app.producto.codigo_pp = ui.item.codigo_pp
                app.producto.descripcion = ui.item.codigo + " | " + ui.item.descripcion
                app.producto.nom_prod = ui.item.descripcion
                app.producto.cantidad = ''
                app.producto.stock = ui.item.cnt
                app.producto.precio = ui.item.precio == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio + "").toFixed(2)
                app.producto.precio2 = ui.item.precio2 == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio2 + "").toFixed(2)
                app.producto.precio3 = ui.item.precio3 == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio3 + "").toFixed(2)
                app.producto.precio4 = ui.item.precio4 == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio4 + "").toFixed(2)
                app.producto.precio_unidad = ui.item.precio_unidad == null ? parseFloat(0 + "").toFixed(2) : parseFloat(ui.item.precio_unidad + "").toFixed(2)

                /*   app.producto.precio = parseFloat(ui.item.precio + "").toFixed(2) */
                /*  app.producto.precio2 = parseFloat(ui.item.precio2 + "").toFixed(2)
                 app.producto.precio3 = parseFloat(ui.item.precio3 + "").toFixed(2)
                 app.producto.precio4 = parseFloat(ui.item.precio4 + "").toFixed(2)
                 app.producto.precio_unidad = parseFloat(ui.item.precio_unidad + "").toFixed(2) */
                app.producto.precioVenta = parseFloat(ui.item.precio + "").toFixed(2)
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
                console.log(array);
                $('#input_buscar_productos').val("");
                $("#example-text-input-cnt").focus()
            }
        });

        $("#example-text-input-cnt") .on('keypress',function(e) {
            if(e.which == 13) {
                $("#submit-a-product").click()
                $("#input_buscar_productos").focus()
            }
        });
    })
</script>