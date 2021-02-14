$(document).ready(
		function() {
			// var selected_class = "active";
			var selected_class = "selected";
			$("#success-alert").hide();
			$("#error-alert").hide();
			var table = $('#productTable').DataTable({
				"ajax" : "../ws/products",
				"columns" : [ {
					"data" : "id"
				}, {
					"data" : "name"
				}, {
					"data" : "pricing"
				}, {
					"data" : "category_id"
				}, {
					"data" : "icon"
				}, {
					"data" : "published"
				} ]
			});
			$('#productTable tbody').on(
					'click',
					'tr',
					function() {
						if ($(this).hasClass(selected_class)) {
							$(this).removeClass(selected_class);
						} else {
							table.$('tr.' + selected_class).removeClass(
									selected_class);
							$(this).addClass(selected_class);
						}
					});
			function ajaxCallRequest(f_method, f_url, f_data) {
				var f_contentType = 'application/json; charset=UTF-8';
				$.ajax({
					url : f_url,
					type : f_method,
					contentType : f_contentType,
					dataType : 'json',
					data : f_data,
					error : function(data) {
						var title = "Error !";
						var message = "Error al ejecutar la operación";
						$("#error_title").text(title);
						$("#error_message").text(message);
						$("#categoryModal .close").click();
						$("#error-alert").fadeTo(2000, 500).slideUp(500,
								function() {
									$("#error-alert").slideUp(500);
								});
					},
					success : function(data) {
						var jsonResult = JSON.stringify(data);
						var parsed = JSON.parse(jsonResult);
						var success = parsed.success;
						var message = parsed.mensaje;
						var title = "Success !";
						if (success == false) {
							title = "Error !";
						}
						$("#success_title").text(title);
						$("#success_message").text(message);
						$("#categoryModal .close").click();
						$("#success-alert").fadeTo(2000, 500).slideUp(500,
								function() {
									$("#success-alert").slideUp(500);
								});
						table.ajax.reload();
					}
				});
			}
			$("#sendJSON").click(function(event) {
				event.preventDefault();
				var form = $('#productForm');
				var method = form.attr('method');
				var url = form.attr('action');
				if (method != "POST") {
					var id = document.getElementById("id").value;
					url = url + id;
				}
				var jsonData = {};
				$.each($(form).serializeArray(), function() {
					jsonData[this.name] = this.value;
				});
				var data = JSON.stringify(jsonData);
				console.log(data);
				ajaxCallRequest(method, url, data);
			});
			$("#adicionar").click(function(event) {
				$("#productForm").attr("method", "POST");

				document.getElementById("id").value = 0;
				document.getElementById("name").value = "";
				document.getElementById("category_id").value = "";
				document.getElementById("pricing").value = "";
				document.getElementById("short_description").value = "";
				document.getElementById("long_description").value = "";
				document.getElementById("icon").value = "";
				document.getElementById("published").value = -1;

				$("#sendJSON").html('Adicionar');
				$('#categoryModal').modal('show');
			});
			function editar(method) {
				var data = table.rows('.' + selected_class).data()[0];
				if (data == undefined) {
					var title = "Error !";
					var operacion = "";
					if (method == "PUT") {
						operacion = "modificar.";
					} else {
						operacion = "eliminar.";
					}
					var message = "Por favor seleccione el registro que desea "
							+ operacion;
					$("#error_title").text(title);
					$("#error_message").text(message);
					$("#error-alert").fadeTo(2000, 500).slideUp(500,
							function() {
								$("#error-alert").slideUp(500);
							});
					return;
				}
				if (method == "PUT") {
					$("#sendJSON").html('Modificar');
				} else {
					$("#sendJSON").html('Eliminar');
				}
				var id = data.id;
				var name = data.name;
				var precio = data.pricing;
				var categoria = data.category_id;
				var icon = data.icon;
				var corta = data.short_description;
				var larga = data.long_description;
				var published = data.published;

				$("#productForm").attr("method", method);

				document.getElementById("id").value = id;
				document.getElementById("name").value = name;
				document.getElementById("category_id").value = categoria;
				document.getElementById("pricing").value = precio;
				document.getElementById("short_description").value = corta;
				document.getElementById("long_description").value = larga;
				document.getElementById("icon").value = icon;
				document.getElementById("published").value = published;

				$('#categoryModal').modal('show');
			}
			$("#modificar").click(function(event) {
				editar("PUT");
			});
			$('#eliminar').click(function() {
				editar("DELETE");
			});
		});
