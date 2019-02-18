<section class="content-header">
	<h1>Detalle Producto</h1>
	<ol class="breadcrumb">
		<li><a href="${contextRoot}/home"><i class="fa fa-home"></i>
				Home</a></li>
		<li><a href="${contextRoot}/show/all/products">Products</a></li>
		<li class="active">${product.name}</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">${product.name}</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="col-xs-12 col-sm-4">
						<div class="thumbnail">
							<img src="${img}/${product.code}.jpg" class="img img-responsive" />
						</div>
					</div>
					<!-- Display the product description -->
					<div class="col-xs-12 col-sm-8">
						<h3>${product.name}</h3>
						<hr />
						<p>${product.description}</p>
						<hr />
						<h4>
							Price: <strong> &#8377; ${product.unitPrice}</strong>
						</h4>
						<hr />
						<c:choose>
							<c:when test="${product.quantity < 1}">
								<h4>
									Qty. Available: <span style="color: red">Out of Stock!</span>
								</h4>
							</c:when>
							<c:otherwise>
								<h4>Qty. Available: ${product.quantity}</h4>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>