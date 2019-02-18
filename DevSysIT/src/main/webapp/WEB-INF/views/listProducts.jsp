<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Listado de Productos
        <small>detalles</small>
      </h1>
      
      <c:if test="${userClickAllProducts == true}">
	      <script>
			window.categoryId = '';
		  </script>
	      <ol class="breadcrumb">
	        <li><a href="${contextRoot}/home"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">Todos</li>
	      </ol>
      </c:if>
      
      <c:if test="${userClickCategoryProducts == true}">
	      <script>
			window.categoryId = '${category.id}';
		  </script>
	      <ol class="breadcrumb">
	        <li><a href="${contextRoot}/home"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li class="active">Categoria</li>
	        <li class="active">${category.name}</li>
	      </ol>
      </c:if>
      
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Productos</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="productListTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th></th>
                  <th>Nombre</th>
                  <th>Marca</th>
                  <th>Precio</th>
                  <th>Stock</th>
                </tr>
                </thead>               
                <tfoot>
                <tr>
                  <th></th>
                  <th>Nombre</th>
                  <th>Marca</th>
                  <th>Precio</th>
                  <th>Stock</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->