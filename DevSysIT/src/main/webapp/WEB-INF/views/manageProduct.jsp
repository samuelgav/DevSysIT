<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
	<h1>
		Admin Product<small>formulario</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-home"></i> Home</a></li>
		<li class="active">Administracion</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">

	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-info fade in">${message}</div>
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">Administracion</h3>
				</div>
				<sf:form class="form-horizontal" modelAttribute="product"
					action="${contextRoot}/manage/product" method="POST"
					enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">Nombre
								Producto</label>
							<div class="col-sm-9">
								<sf:input type="text" path="name" class="form-control"
									placeholder="Product Name" />
								<sf:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="brand" class="col-sm-3 control-label">Marca</label>
							<div class="col-sm-9">
								<sf:input type="text" path="brand" class="form-control"
									placeholder="Brand Name" />
								<sf:errors path="brand" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">Descripcion</label>
							<div class="col-sm-9">
								<sf:textarea path="description" class="form-control"
									placeholder="Enter your description here!" />
								<sf:errors path="description" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="unitPrice" class="col-sm-3 control-label">Precio
								Unitario</label>
							<div class="col-sm-9">
								<sf:input type="number" path="unitPrice" class="form-control"
									placeholder="Enter Unit Price" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="quantity" class="col-sm-3 control-label">Cantidad</label>
							<div class="col-sm-9">
								<sf:input type="number" path="quantity" class="form-control"
									placeholder="Enter Quantity" />
								<sf:errors path="quantity" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="categoryId" class="col-sm-3 control-label">Categoria</label>
							<div class="col-sm-9">
								<sf:select path="categoryId" items="${categories}"
									itemLabel="name" itemValue="id" class="form-control select2" />
								<div class="text-right">
									<br />
									<sf:hidden path="id" />
									<sf:hidden path="code" />
									<sf:hidden path="supplierId" />
									<sf:hidden path="active" />
									<button type="button" class="btn bg-blue btn-xs"
										data-toggle="modal" data-target="#myCategoryModal">Add
										New Category</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="file" class="col-sm-3 control-label">Foto</label>
							<div class="col-sm-9">
								<div class="btn bg-orange btn-file">
									<i class="fa fa-paperclip"></i> Cargar Imagen
									<sf:input type="file" path="file" class="form-control" />
								</div>
								<sf:errors path="file" cssClass="help-block" element="em" />
							</div>
						</div>
					</div>
					<div class="box-footer">
						<input type="submit" name="submit" value="Save"
							class="btn bg-olive pull-right" />
					</div>
				</sf:form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myCategoryModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Nueva Categoria</h4>
              </div>
              <div class="modal-body">
              <sf:form id="categoryForm" class="form-horizontal" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
	        	
       			<div class="form-group">
					<label class="control-label col-md-3">Name</label>
					<div class="col-md-9 validate">
						<sf:input type="text" path="name" class="form-control"
							placeholder="Category Name" /> 
					</div>
				</div>
       			
       			<div class="form-group">				
					<label class="control-label col-md-3">Description</label>
					<div class="col-md-9 validate">
						<sf:textarea path="description" class="form-control"
							placeholder="Enter category description here!" /> 
					</div>
				</div>	        	        
	        
	        
				<div class="form-group">				
					<div class="col-md-offset-4 col-md-4">					
						<input type="submit" name="submit" value="Save" class="btn bg-red"/>						
					</div>
				</div>	        
	        </sf:form>   
              </div>              
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Available Products</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="productsTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Id</th>
				  <th>&#160;</th>
				  <th>Name</th>
				  <th>Brand</th>
				  <th>Qty. Avail</th>
				  <th>Unit Price</th>
				  <th>Activate</th>				
				  <th>Edit</th>
                </tr>
                </thead>               
                <tfoot>
                <tr>
                  <th>Id</th>
				  <th>&#160;</th>
				  <th>Name</th>
				  <th>Brand</th>
				  <th>Qty. Avail</th>
				  <th>Unit Price</th>
				  <th>Activate</th>				
				  <th>Edit</th>
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
