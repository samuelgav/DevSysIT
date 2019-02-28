<section class="content">
	
	<c:if test="${not empty message}">		
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>			
	</c:if>
	
	
	<c:choose>
		<c:when test="${not empty cartLines}">
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Productos</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="cart" class="table table-hover table-condensed">
								<thead>
									<tr>
										<th style="width: 50%">Product</th>
										<th style="width: 10%">Price</th>
										<th style="width: 8%">Quantity</th>
										<th style="width: 22%" class="text-center">Subtotal</th>
										<th style="width: 10%"></th>
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${cartLines}" var="cartLine">
									<tr>
										<td data-th="Product">
											<div class="row">
												<div class="col-sm-2 hidden-xs">
													<img src="${img}/${cartLine.product.code}.jpg" alt="${cartLine.product.name}"
														class="img-responsive cartImg" />
												</div>
												<div class="col-sm-10">
													<h4 class="nomargin">${cartLine.product.name}
														<c:if test="${cartLine.available == false}">
															<strong class="unavailable">(Not Available)</strong>	
														</c:if>													
													</h4>
													<p>Brand : ${cartLine.product.brand}</p>
													<p>Description : ${cartLine.product.description}</p>
												</div>
											</div>
										</td>
										<td data-th="Price">$ ${cartLine.buyingPrice}</td>
										<td data-th="Quantity">
										<input type="number" value="${cartLine.productCount}" id="count_${cartLine.id}" min="1" max="3"
											class="form-control text-center" ></td>
										<td data-th="Subtotal" class="text-center">$ ${cartLine.total}</td>
										<td class="actions" data-th="">
											<button class="btn bg-blue btn-sm" name="refreshCart" value="${cartLine.id}"
											>
												<span class="glyphicon glyphicon-refresh"></span>
											</button>
											<a class="btn bg-red btn-sm" href="${contextRoot}/cart/${cartLine.id}/delete" >
												<span class="glyphicon glyphicon-trash"></span>
											</a>
										</td>
									</tr>								
								</c:forEach>	
								</tbody>
								<tfoot>
									<tr class="visible-xs">
										<td class="text-center"><strong>Total $ ${userModel.cart.grandTotal}</strong></td>
									</tr>
									<tr>
										<td><a href="#" class="btn bg-orange"><span
												class="glyphicon glyphicon-chevron-left"></span> Continue
												Shopping</a></td>
										<td colspan="2" class="hidden-xs"></td>
										<td class="hidden-xs text-center"><strong>Total $ ${userModel.cart.grandTotal}</strong></td>
										<td><a href="#" class="btn bg-olive">Checkout <span
												class="glyphicon glyphicon-chevron-right"></span></a></td>
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
		</c:when>
		<c:otherwise>
			<div class="pad margin no-print">
		      <div class="callout callout-info" style="margin-bottom: 0!important;">
		        <h4><i class="fa fa-info"></i> Note:</h4>
		        <h1 class="text-center">Tu carro esta vacio!</h1>	
		      </div>
    		</div>		
		</c:otherwise>
	</c:choose>
</section>

