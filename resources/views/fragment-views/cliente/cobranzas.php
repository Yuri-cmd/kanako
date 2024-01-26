<div class="page-title-box">
    <div class="row align-items-center">
        <div class="col-md-8">
            <h6 class="page-title">Cobranzas</h6>
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

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Venta de Producto</h4>

                <div class="card-title-desc">

                </div>
                <div class="">
                    <table id="datatable" class="table table-responsive table-bordered dt-responsive  text-center table-sm" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                        <thead>
                        <tr>
                            <th >Id</th>
                            <th >Codigo</th>
                            <th >F. Emision</th>
                            <th >F. Vencimiento</th>
                            <th >Cliente</th>
                            <th >Total</th>
                            <th >Pagado</th>
                            <th >Saldo</th>
                            <th >Situacion</th>
                            <th >Dias V.</th>
                            <th >Detalles</th>

                        </tr>
                        </thead>

                    </table>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div id="" class="col-xs-12 col-sm-12 col-md-12 no-padding">


                                    <table id="datatableDiasCompras" class="table table-bordered dt-responsive nowrap text-center table-sm" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">Id</th>
                                            <th style="text-align: center;">Monto</th>
                                            <th style="text-align: center;">F. Vencimiento</th>
                                            <th style="text-align: center;">Estado</th>
                                            <th style="text-align: center;">Pagar</th>


                                        </tr>
                                        </thead>

                                    </table>
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

<script>
    $(document).ready(function() {

       /* $.ajax({
            type: 'POST',
            url: _URL + '/ajs/cuentas/cobrar/render',
            success: function(resp) {

                console.log(JSON.parse(resp));
            }
        });*/

        const datatable = $("#datatable").DataTable({
            order: [[ 0, "desc" ]],
            paging: true,
            bFilter: true,
            ordering: true,
            searching: true,
            destroy: true,
            ajax: {
                url: _URL + "/ajs/cuentas/cobrar/render",
                method: "POST",
                dataSrc: "",
            },
            language: {
                url: "ServerSide/Spanish.json",
            },
            columns: [{
                data: "id_venta",
                class: "text-center",
            },
                {
                    data: "factura",
                    class: "text-center",
                },
                {
                    data: "fecha_emision",
                    class: "text-center",
                },
                {
                    data: "fecha_vencimiento",
                    class: "text-center",
                },
                {
                    data: "cliente",
                    class: "text-center",
                },
                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {
                        if ( row.total !== null) {
                            return `<div class="text-center">
                                            <div class="btn-group">S/ ${row.total}</div></div>`;
                        } else {
                            return `<div class="text-center">
                                            <div class="btn-group"></div></div>`;
                        }

                    },
                },
                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {
                        if ( row.pagado !== null) {
                            return `<div class="text-center">
                                            <div class="btn-group">S/ ${row.pagado}</div></div>`;
                        } else {
                            return `<div class="text-center">
                                            <div class="btn-group"></div></div>`;
                        }

                    },
                },
                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {
                        if ( row.saldo !== null) {
                            return `<div class="text-center">
                                            <div class="btn-group">S/ ${row.saldo}</div></div>`;
                        } else {
                            return `<div class="text-center">
                                            <div class="btn-group"></div></div>`;
                        }

                    },
                },

                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {

                        let vencimiento = row.fecha_vencimiento
                        const [year, month, day] = vencimiento.split('-');
                        const vencimientoFecha = [month, day, year].join('/');
                        var today = new Date();
                        var dd = String(today.getDate()).padStart(2, '0');
                        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                        var yyyy = today.getFullYear();
                        today = mm + '/' + dd + '/' + yyyy;
                        if ((parseFloat(row.total).toFixed(3) == parseFloat(row.pagado).toFixed(3))) {
                            return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-success">Pagado</span></div></div>`;
                        } else if ((parseFloat(row.total).toFixed(3) > parseFloat(row.pagado).toFixed(3)) && today > vencimientoFecha) {
                            return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-danger">Vencido</span></div></div>`;
                        } else if ((parseFloat(row.total).toFixed(3) > parseFloat(row.pagado).toFixed(3)) && today < vencimientoFecha) {
                            return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-info">Vigente</span></div></div>`;
                        }


                    },
                },

                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {
                        let vencimiento = row.fecha_vencimiento
                        const [year, month, day] = vencimiento.split('-');
                        const vencimientoFecha = [month, day, year].join('/');
                        var today = new Date();
                        var dd = String(today.getDate()).padStart(2, '0');
                        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                        var yyyy = today.getFullYear();
                        today = mm + '/' + dd + '/' + yyyy;
                        const dateToday = new Date(today);
                        const dateVencimiento = new Date(vencimientoFecha);
                        const diffTime = Math.abs(dateToday - dateVencimiento);
                        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                        /* console.log(diffDays); */
                        if (today > vencimientoFecha) {
                            return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-danger">${diffDays}</span></div></div>`;
                        } else {
                            return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-success">0</span></div></div>`;
                        }

                    },
                },
                {
                    data: null,
                    class: "text-center",
                    render: function(data, type, row) {
                        return `<div class="text-center">
                                            <div class="btn-group"><button  data-id="${Number(
                            row.id_venta
                        )}" class="btn btn-success btnDetalles btn-sm"><i class="fa fa-eye"></i> </button></div></div>`;
                    },
                },
            ],
        });

        $("#datatable").on("click", ".btnDetalles ", function(event) {
            $("#loader-menor").show()
            var table = $("#tablaMaquina").DataTable();
            var trid = $(this).closest("tr").attr("id");
            var id = $(this).data("id");
            $("#exampleModal").modal("show");
            $("#exampleModal")
                .find(".modal-title")
                .text("Detalles compra N° " + id);
            $.ajax({
                url: _URL + "/ajas/getAllCuotas/byIdVenta",
                data: {
                    id: id,
                },
                type: "post",
                success: function(resp) {
                    $("#loader-menor").hide()
                    resp = JSON.parse(resp)
                    console.log(resp);
                    /*    console.log(resp[0]['fecha']); */

                    /*   let vencimiento = resp[0]['fecha']
                      const [year, month, day] = vencimiento.split('-');
                      const vencimientoFecha = [month, day, year].join('/');
                      var today = new Date();
                      var dd = String(today.getDate()).padStart(2, '0');
                      var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                      var yyyy = today.getFullYear();
                      today = mm + '/' + dd + '/' + yyyy;
                      const dateToday = new Date(today);
                      const dateVencimiento = new Date(vencimientoFecha);
                      const diffTime = Math.abs(dateToday - dateVencimiento);
                      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                      console.log(today);
                      console.log('vencimient ' + vencimientoFecha); */
                    datatableDiasCompras = $("#datatableDiasCompras").DataTable({

                        paging: true,
                        bFilter: true,
                        ordering: true,
                        searching: true,
                        destroy: true,
                        data: resp,
                        language: {
                            url: "ServerSide/Spanish.json",
                        },
                        columns: [{
                            data: "dias_venta_id",
                            class: "text-center",
                        },
                            {
                                data: "monto",
                                class: "text-center",
                            },
                            {
                                data: "fecha",
                                class: "text-center",
                            },
                            {
                                data: null,
                                class: "text-center",
                                render: function(data, type, row) {

                                    let vencimiento = row.fecha
                                    const [year, month, day] = vencimiento.split('-');
                                    const vencimientoFecha = [month, day, year].join('/');
                                    var today = new Date();
                                    var dd = String(today.getDate()).padStart(2, '0');
                                    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
                                    var yyyy = today.getFullYear();
                                    today = mm + '/' + dd + '/' + yyyy;
                                    if ((today > vencimientoFecha) && row.estado == '0') {
                                        return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-danger">Vencido</span></div></div>`;
                                    } else if ((today < vencimientoFecha || vencimientoFecha == today) && row.estado == '0') {
                                        return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-success">Vigente</span></div></div>`;
                                    } else if (row.estado == '1') {
                                        return `<div class="text-center">
              <div class="btn-group"><span class="badge bg-info">Pagado</span></div></div>`;
                                    }


                                },
                            },
                            {
                                data: null,
                                class: "text-center",
                                render: function(data, type, row) {
                                    if (row.estado == '0') {
                                        return `<div class="text-center">
                                            <div class="btn-group"><button  data-id="${Number(
                                            row.dias_venta_id
                                        )}" class="btn btn-success btnPagar btn-sm"><i class="fas fa-money-bill"></i> </button></div></div>`;
                                    }
                                    if (row.estado == '1') {
                                        return `<div class="text-center">
                                            <div class="btn-group"></div></div>`;
                                    }
                                },
                            },

                        ],
                    });


                },
            })
        });
        $("#datatableDiasCompras").on("click", ".btnPagar ", function(event) {

            var table = $("#tablaMaquina").DataTable();
            var trid = $(this).closest("tr").attr("id");
            var id = $(this).data("id");
            Swal.fire({
                title: '¿Desea pagar la cuota N° ' + id + ' ? ',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si'
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#loader-menor").show()
                    $.ajax({
                        type: 'POST',
                        url: _URL + '/ajs/pagar/cuota/pago',
                        data: {
                            id: id
                        },
                        success: function(resp) {
                            $("#loader-menor").hide();
                            let data = JSON.parse(resp)
                            console.log(data);
                            /*  */
                        }
                    });
                }
            })
        })
    })
</script>