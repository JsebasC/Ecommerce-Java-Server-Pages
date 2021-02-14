package org.software.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


import org.software.util.DataBase;

@Path("/products")
public class ProductService {

	@POST
	@Path("/")
	@Consumes({ "application/json" })
	@Produces("application/json")
	public Response add(Product Producto) {
		DataBase database = new DataBase();
		Connection connection1 = null;
		PreparedStatement preparedStatement1 = null;
		String sql = "";
		String mensaje = "";
		int inserteds = 0;
	try {
		connection1 = database.getConnection("admin");
		sql = "INSERT INTO products( published, category_id, name, pricing, short_description, long_description, icon)";
		sql += " VALUES (?,?,?,?,?,?,?)";
		
		
		
		preparedStatement1 = connection1.prepareStatement(sql);
		preparedStatement1.setInt(1, Producto.getPublished());
		preparedStatement1.setInt(2, Producto.getCategory_id());
		preparedStatement1.setString(3, Producto.getName());
		preparedStatement1.setDouble(4, Producto.getPricing());
		preparedStatement1.setString(5, Producto.getShort_description());
		preparedStatement1.setString(6, Producto.getLong_description());
		preparedStatement1.setString(7, Producto.getIcon());
		
		
		inserteds = preparedStatement1.executeUpdate();
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	} finally {
		database.closeObject(preparedStatement1);
		database.closeObject(connection1);
	}
	if (inserteds > 0) {
		mensaje = "{\"mensaje\":\"Adicionar OK\"}";
		return Response.status(200).entity(mensaje).build();
	} else {
		mensaje = "{\"mensaje\":\"Error al adicionar\"}";
		return Response.status(400).entity(mensaje).build();
	}
	}
	
	
	
	
	
	@GET
	@Path("/")
	@Produces("application/json")
	// @Produces("application/xml")
	public ProductList getAll() {
		ArrayList<Product> productList = new ArrayList<Product>();
		DataBase database = new DataBase();
		Connection connection1 = null;
		Statement statement1 = null;
		ResultSet rs1 = null;
		String sql = "";
	try {
		connection1 = database.getConnection("guest");
		statement1 = connection1.createStatement();
		sql = "select * from products";
		rs1 = statement1.executeQuery(sql);
	while (rs1.next()) {
		int id = rs1.getInt("id");
		int published = rs1.getInt("published");
		int categoria = rs1.getInt("category_id");
		String name = rs1.getString("name");
		double precio = rs1.getDouble("pricing");
		String cortadescripcion = rs1.getString("short_description");
		String descripcion = rs1.getString("long_description");
		String icon = rs1.getString("icon");
		
		
		
		Product producto = new Product();
		producto.setId(id);
		producto.setPublished(published);
		producto.setCategory_id(categoria);
		producto.setName(name);
		producto.setPricing(precio);
	producto.setShort_description(cortadescripcion);
	producto.setLong_description(descripcion);
		producto.setIcon(icon);
		
		
		
		productList.add(producto);
	}
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	} finally {
		database.closeObject(rs1);
		database.closeObject(statement1);
		database.closeObject(connection1);
	}
		return new ProductList(productList);
	}
	
	
	
	@PUT
	@Path("/{id}")
	@Consumes({ "application/json" })
	@Produces("application/json")
	public Response update(Product Producto, @PathParam(value = "id") int id) {
		DataBase database = new DataBase();
		Connection connection1 = null;
		PreparedStatement preparedStatement1 = null;
		String sql = "";
		String mensaje = "";
		int updates = 0;
	try {
		
		
		connection1 = database.getConnection("admin");
		sql = "UPDATE products SET published=?, category_id=?, name=?, pricing=?, short_description=?, long_description=?, icon=?";
		sql += " WHERE id=?";
		preparedStatement1 = connection1.prepareStatement(sql);
		
		preparedStatement1.setInt(1, Producto.getPublished());
		preparedStatement1.setInt(2, Producto.getCategory_id());
		preparedStatement1.setString(3, Producto.getName());
		preparedStatement1.setDouble(4, Producto.getPricing());
		preparedStatement1.setString(5, Producto.getShort_description());
		preparedStatement1.setString(6, Producto.getLong_description());
		preparedStatement1.setString(7, Producto.getIcon());
		preparedStatement1.setInt(8, id);
		
		updates = preparedStatement1.executeUpdate();
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	} finally {
		database.closeObject(preparedStatement1);
		database.closeObject(connection1);
	}
	if (updates > 0) {
		mensaje = "{\"mensaje\":\"Modificar OK\"}";
		return Response.status(200).entity(mensaje).build();
	} else {
		mensaje = "{\"mensaje\":\"Error al modificar\"}";
		return Response.status(400).entity(mensaje).build();
	}
	}
	
	@DELETE
	@Path("/{id}")
	@Consumes({ "application/json" })
	@Produces("application/json")
	public Response adicionar(@PathParam(value = "id") int id) {
		DataBase database = new DataBase();
		Connection connection1 = null;
		PreparedStatement preparedStatement1 = null;
		String sql = "";
		String mensaje = "";
		int deleteds = 0;
	try {
		connection1 = database.getConnection("admin");
		sql = "DELETE FROM products WHERE id=?";
		preparedStatement1 = connection1.prepareStatement(sql);
		preparedStatement1.setInt(1, id);
		deleteds = preparedStatement1.executeUpdate();
	} catch (Exception e) {
		System.out.println("Error: " + e.toString());
	} finally {
		database.closeObject(preparedStatement1);
		database.closeObject(connection1);
	}
	if (deleteds > 0) {
		mensaje = "{\"mensaje\":\"Eliminar OK\"}";
		return Response.status(200).entity(mensaje).build();
	} else {
		mensaje = "{\"mensaje\":\"Error al eliminar\"}";
		return Response.status(400).entity(mensaje).build();
	}
	}
	
	
	
	
	@GET
	@Path("/{product_id}")
	@Produces("application/json")
	public ProductList getProductById(@PathParam(value = "product_id") int product_id) {
		ArrayList productList = new ArrayList();
		
		DataBase database = new DataBase();
		Connection conexion1 = null;
		Statement sentencia1 = null;
		ResultSet rs1 = null;
		String sql = "";
		try {
			conexion1 = database.getConnection("guest");
			sentencia1 = conexion1.createStatement();
			
			double media = 0;
			sql = "select avg(rating) as media from reviews";
			sql = sql + " where product_id = " + product_id;
			rs1 = sentencia1.executeQuery(sql);
			if (rs1.next()) {
				media = rs1.getDouble("media");
			}
			
			sql = "select * from products where id = " + product_id;
			rs1 = sentencia1.executeQuery(sql);
			while (rs1.next()) {
				long id = rs1.getLong("id");
				int category_id = rs1.getInt("category_id");
				String name = rs1.getString("name");
				double pricing = rs1.getDouble("pricing");
				String short_description = rs1.getString("short_description");
				String long_description = rs1.getString("long_description");
				String icon = rs1.getString("icon");
				
				Product product = new Product();
				product.setId(id);
				product.setCategory_id(category_id);
				product.setName(name);
				product.setPricing(pricing);
				product.setShort_description(short_description);
				product.setLong_description(long_description);
				product.setIcon(icon);
			
				
				productList.add(product);
			}
		} catch (Exception e) {
			System.out.println("Error: " + e.toString());
		}
		finally {
			database.closeObject(rs1);
			database.closeObject(sentencia1);
			database.closeObject(conexion1);
		}
		
		return new ProductList(productList);
	}
	
	
}
