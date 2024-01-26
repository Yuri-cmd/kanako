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
                <li class="breadcrumb-item"><a href="javascript: void(0);">Facturacion</a></li>
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
                                <input type="hidden" name="" id="idVentaUrl" value="<?php echo $idVenta; ?>">
                                <div class="form-group row mb-3">
                                    <label class="col-lg-2 control-label">Buscar</label>
                                    <div class="col-lg-10">

                                        <div class="input-group">
                                            <input type="text" placeholder="Consultar Productos" class="form-control ui-autocomplete-input" id="input_buscar_productos" autocomplete="off">
                                            <div class="input-group-btn">
                                                <button hidden @click="buscarPorCodigoBarra" type="button" class="btn btn-primary">Buscar Por Codigo Barra</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row mb-3">
                                    <label class="col-lg-2 control-label">Descripcion</label>
                                    <div class="col-lg-10">
                                        <input required v-model="producto.descripcion" type="text" placeholder="Descripcion" class="form-control" readonly="true">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <div class="row">
                                        <div class="row  col-lg-4">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Stock Actual</label>
                                            <div class="col-sm-8">
                                                <input disabled v-model="producto.stock" class="form-control text-center" type="text" placeholder="0">
                                            </div>
                                        </div>
                                        <div class="row  col-lg-4">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Cantidad</label>
                                            <div class="col-sm-8">
                                                <input @keypress="onlyNumber" required v-model="producto.cantidad" class="form-control text-center" type="text" placeholder="0" id="example-text-input">
                                            </div>
                                        </div>
                                        <div class="row  col-lg-3">
                                            <label for="example-text-input" class="col-sm-4 col-form-label">Precio</label>
                                            <div class="col-sm-8">
                                                <input @keypress="onlyNumber" required v-model="producto.precio" class="form-control text-end" type="text" placeholder="0.00" id="example-text-input">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Agregar
                                        </div>
                                    </div>

                                </div>


                            </form>
                        </div>

                        <div class="col-md-12 mt-5">
                            <h4>Detalle Venta</h4>
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
                                        <td><span v-if="!item.edicion" >{{item.precio}}</span><input v-if="item.edicion" v-model="item.precio"></td>

                                        <td>{{item.precio*item.cantidad}}</td>
                                        <td><button @click="eliminarItemPro(index)" type="button" class="btn btn-danger btn-xs">
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
                                                <option value="2">Credito</option>
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
                                                        <label class="control-label">Emision</label>
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
                                        <label class="control-label">Dias de pago</label>
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
                                                <input v-model="venta.dir_cli" type="text" placeholder="Direccion 1" class="form-control ui-autocomplete-input" autocomplete="off">
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
                                                <input v-model="venta.dir2_cli" type="text" placeholder="Direccion 2" class="form-control ui-autocomplete-input" autocomplete="off">
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
                                            <button @click="guardarVenta" type="button" class="btn btn-lg btn-primary" id="btn_finalizar_pedido">
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
                    <h5 class="modal-title" id="exampleModalLabel">Dias de Pagos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>



</div>



<script>
    /* let igv_apli=parseFloat("<?= $igv_empresa ?>"); */
    /* function modalFunsns(link, linkd, nameFile, num, email) {
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
            title: "Enviar Factura",
            html,
            didOpen: () => {
                //Swal.showLoading()
                const formSendEmail = Swal.getHtmlContainer().querySelector('#from-sen-email');
                formSendEmail.addEventListener("submit", function(evt) {
                    evt.preventDefault();
                    $("#loader-menor").show();
                    _post("/ajs/send/comprobante/email", $(this).serialize(),
                        function(resp) {
                            console.log(resp);
                            if (resp.res) {
                                alertExito("Enviado")
                            } else {
                                alertAdvertencia("No se pudo Enviar")
                            }
                        });
                });
                const formSendWatsapp = Swal.getHtmlContainer().querySelector('#from-sen-whatsapp');
                formSendWatsapp.addEventListener("submit", function(evt) {
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
                    //console.log($(this).find("input[name='num']"))
                });
                console.log(formSendEmail);
            },
        })
        setTimeout(function() {}, 100)
    } */
    $(document).ready(function() {
        const app = new Vue({
            el: "#container-vue",
            data: {
                apli_igv_is: true,
                idVenta: '',
                metodosPago:[],
                producto: {
                    productoid: "",
                    descripcion: "",
                    nom_prod: "",
                    cantidad: "",
                    stock: "",
                    precio: "",
                    codigo: "",
                    costo: "",
                    codsunat: "",
                },
                productos: [],
                venta: {
                    observ: '',
                    moneda:'',
                    tc:'',
                    metodo:'',
                    apli_igv: 1,
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
                loadProductos() {
                    /*    var pathArray = */
                    /*      console.log(pathArray[3]); */
                    let idVenta = $('#idVentaUrl').val();
                    console.log(idVenta);
                    /*  idVenta = idVenta[3]  */
                    this.idVenta = idVenta
                    var self = this
                    _ajax("/ajs/cargar/venta/productos", "POST", {
                            idVenta
                        },
                        function(resp) {
                            console.log("zzzzzzzzzz:",resp)
                            $("#loader-menor").hide()
                            resp=resp.map(err=>{
                                err.edicion = false
                                return err
                            });
                            self.productos.push(resp)
                            self.productos = self.productos[0]
                        }
                    )
                    /*  return */
                    _ajax("/ajs/cargar/venta/info", "POST", {
                            idVenta
                        },
                        function(resp) {
                            $("#loader-menor").hide()
                            console.log("aaaaaaa:",resp[0]);
                            let dataVenta = resp[0]
                            self.venta.tc = dataVenta.cm_tc
                            self.venta.moneda = dataVenta.moneda
                            self.venta.metodo = dataVenta.medoto_pago_id
                            self.venta.apli_igv = dataVenta.apli_igv
                            self.venta.tipo_doc = dataVenta.id_tido
                            self.venta.tipo_pago = dataVenta.id_tipo_pago
                            self.venta.fecha = dataVenta.fecha_emision
                            self.venta.fechaVen = dataVenta.fecha_vencimiento
                            self.venta.serie = dataVenta.serie
                            self.venta.numero = dataVenta.numero
                            self.venta.id_cliente = dataVenta.id_cliente
                            self.venta.observ = dataVenta.observacion
                            self.venta.dir_cli = dataVenta.direccion

                            self.venta.dias_pago = dataVenta.dias_pagos

                            _ajax("/ajs/clientes/getOne", "POST", {
                                    id: self.venta.id_cliente
                                },
                                function(resp) {
                                    $("#loader-menor").hide()
                                    console.log(resp);
                                    let dataCliente = resp[0]
                                    self.venta.num_doc = dataCliente.documento
                                    self.venta.nom_cli = dataCliente.datos
                                    /*    let dataVenta = resp[0]
                                       self.venta.apli_igv = dataVenta.apli_igv
                                       self.venta.tipo_doc = dataVenta.id_tido
                                       self.venta.tipo_pago = dataVenta.id_tipo_pago
                                       self.venta.fecha = dataVenta.fecha_emision
                                       self.venta.fechaVen = dataVenta.fecha_vencimiento
                                       self.venta.serie = dataVenta.serie
                                       self.venta.numero = dataVenta.numero
                                       self.venta.id_cliente = dataVenta.id_cliente
                                       console.log(); */
                                    /*  self.productos.push(resp)
                                     self.productos = self.productos[0] */
                                }
                            )
                            /*  self.productos.push(resp)
                             self.productos = self.productos[0] */
                        }
                    )



                    console.log('servicios cargados');

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
                            vue.productos = resp.productos
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
                                    app._data.venta.dir_cli = resp.data.direccion.trim().length > 0 ? resp.data.direccion : '-'
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

                        if (continuar) {
                            if (this.venta.total > 0) {
                                const data = {
                                    ...this.venta,
                                    listaPro: JSON.stringify(this.productos)
                                }
                                data.idVenta = this.idVenta
                                data.dias_lista = JSON.stringify(data.dias_lista)
                                console.log(data);
                                $("#loader-menor").show();
                                _ajax("/ajs/ventas/productos/edit", "POST",
                                    data,
                                    function(resp) {
                                        console.log(resp);
                                        if (resp.res) {
                                            alertExito("Exito", "Venta Guardada")
                                                .then(function() {
                                                    $("#backbuttonvp").click();
                                                    /* modalFunsns(resp.urlFact, resp.urlFactd,
                                                        resp.nomFact, resp.cel, resp.email) */

                                                })

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
                        productoid: "",
                        descripcion: "",
                        cantidad: "",
                        precio: "",
                        codigo: "",
                        costo: "",
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
                        total += prod.precio * prod.cantidad
                    })
                    this.venta.total = total;
                    return total.toFixed(2);
                }
            }
        });
        app.buscarSNdoc();
        app.loadProductos();

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
        $("#input_buscar_productos").autocomplete({
            source: _URL + "/ajs/cargar/productos",
            minLength: 1,
            select: function(event, ui) {
                event.preventDefault();
                console.log(ui.item);
                app.producto.productoid = ui.item.codigo
                app.producto.descripcion = ui.item.codigo + " | " + ui.item.descripcion
                app.producto.nom_prod = ui.item.descripcion
                app.producto.cantidad = ''
                app.producto.stock = ui.item.cnt
                app.producto.precio = ui.item.precio
                app.producto.codigo = ui.item.codigo
                app.producto.costo = ui.item.costo
                $('#input_buscar_productos').val("");
            }
        });

        <?php
        if (isset($_GET["coti"])) {
            echo "app.cargarCotizacion()";
        }
        ?>
    })
</script>