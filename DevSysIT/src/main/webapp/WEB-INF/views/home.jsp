<!-- DataTable Bootstrap Script -->
<script src="${js}/angular.js"></script>
<!-- DataTable Bootstrap Script -->
<script src="${js}/productsController.js"></script>


<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Catalogo de Productos <small>mas vistos y comprados</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Catelogo</li>
	</ol>
</section>

<!-- Main content -->
<section class="content" ng-app="ShoppingApp"
	ng-controller="ProductController as pCtrl"
	ng-init="pCtrl.fetchProducts()">

	<!-- START CAROUSEL-->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-solid">
				<div class="box-header with-border">
					<h3 class="box-title">Productos</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"
								class=""></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"
								class=""></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="${img}/banner1.jpg"
									alt="First slide">
								<div class="carousel-caption">First Slide</div>
							</div>
							<div class="item">
								<img class="slide-image" src="${img}/banner2.jpg"
									alt="Second slide">
								<div class="carousel-caption">Second Slide</div>
							</div>
							<div class="item">
								<img class="slide-image" src="${img}/banner3.jpg"
									alt="Third slide">
								<div class="carousel-caption">Third Slide</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="fa fa-angle-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="fa fa-angle-right"></span>
						</a>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<!-- END CAROUSEL-->

	<div class="row">
		<div class="col-xs-12">
			<h3>Nuestros productos mas vistos</h3>
		</div>
	</div>

	<div class="row">
		<div class="col-md-3" ng-repeat="product in pCtrl.mvProducts">
			<div class="box box-widget">

				<div class="box-header with-border">
					<div class="user-block">
						<span class="username"><a href="#">{{product.name}}</a></span>
					</div>
				</div>

				<div class="box-body">
					<img class="img-responsive pad"
						ng-src="${img}/{{product.code}}.jpg" alt="{{product.name}}">
				</div>


				<div class="box-footer box-comments">

					<div class="box-comment">
						<div class="comment-text">
							<span class="username"> {{product.name}} <span
								class="text-muted pull-right">&#8377;
									{{product.unitPrice}}</span>
							</span>
							<!-- /.username -->
							{{product.description}}
						</div>
					</div>

					<div class="box-comment">
						<div class="comment-text">
							<a ng-href="${contextRoot}/show/{{product.id}}/product"
								class="btn bg-olive pull-right">View</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>

	<div class="row">
		<div class="col-xs-12">
			<h3>Nuestros productos mas comprados</h3>
			<hr />
		</div>
	</div>

	<div class="row">
		<div class="col-md-3" ng-repeat="product in pCtrl.mpProducts">
			<div class="box box-widget">

				<div class="box-header with-border">
					<div class="user-block">
						<span class="username"><a href="#">{{product.name}}</a></span>
					</div>
				</div>

				<div class="box-body">
					<img class="img-responsive pad"
						ng-src="${img}/{{product.code}}.jpg" alt="{{product.name}}">
				</div>


				<div class="box-footer box-comments">

					<div class="box-comment">
						<div class="comment-text">
							<span class="username"> {{product.name}} <span
								class="text-muted pull-right">&#8377;
									{{product.unitPrice}}</span>
							</span>
							<!-- /.username -->
							{{product.description}}
						</div>
					</div>

					<div class="box-comment">
						<div class="comment-text">
							<a ng-href="${contextRoot}/show/{{product.id}}/product"
								class="btn bg-olive pull-right">View</a>
						</div>
					</div>

				</div>

			</div>

		</div>

	</div>

</section>
<!-- /.content -->
