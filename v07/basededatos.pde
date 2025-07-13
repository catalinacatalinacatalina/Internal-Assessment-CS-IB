import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;

Connection con;
Statement query;

// Conexión a la BBDD

void connectBBDD() {
    try {
         // Ruta absoluta (temporalmente para asegurarse que funciona)
        String path = sketchPath("data/data.db");
        String url = "jdbc:sqlite:" + path;

        // Cargar el driver JDBC antes de todo
        Class.forName("org.sqlite.JDBC");

        // Establecer conexión y asignar a variable global
        con = DriverManager.getConnection(url);
        if(con != null) 
            println("Connection to SQLite has been established.");
        
    } catch(ClassNotFoundException e) {
        println("SQLite JDBC driver not found: " + e.getMessage());
    } catch(SQLException e) {
        println("Connection to SQLite failed: " + e.getMessage());
    }
}

// Obtener número de filas de una tabla
public int getNumRowsTaula(String nomTaula){
     int numRows = 0;
    
    if (con == null) {
        println("No hay conexión con la base de datos.");
        return -1;
    }

    try {
        query = con.createStatement();
        String q = "SELECT COUNT(*) AS total FROM " + nomTaula;
        ResultSet rs = query.executeQuery(q);

        if (rs.next()) {
            numRows = rs.getInt("total");
        }
        
        rs.close();
        query.close();
    } catch (SQLException e) {
        println("Error al obtener número de filas: " + e.getMessage());
    }

    return numRows;
}

// Obtener datos de jugadores
public String[][] getInfoTablaJugadores(){
    int numFilas = getNumRowsTaula("jugador");
    int numCols = 3;
    String[][] datos = new String[numFilas][numCols];

    try {
        ResultSet rs = query.executeQuery(
            "SELECT j.nombre AS nombre, j.dorsal AS dorsal, p.nombre AS posicion " +
            "FROM jugador j, posicion p WHERE j.posicion_id = p.id"
        );

        int i = 0;
        while (rs.next()) {
            datos[i][0] = String.valueOf(rs.getInt("dorsal"));
            datos[i][1] = rs.getString("nombre");
            datos[i][2] = rs.getString("posicion");
            i++;
        }
        println("Informacion JUGADORES \t-- COMPLETADO");
        return datos;

    } catch (Exception e) {
        println("Error getInfoTablaJugadores");
        e.printStackTrace();
        return null;
    }
}

// Obtener datos de equipos
public String[][] getInfoTablaEquipo(){
    int numFilas = getNumRowsTaula("equipo");
    int numCols = 3;
    String[][] datos = new String[numFilas][numCols];

    try {
        ResultSet rs = query.executeQuery(
            "SELECT j.id AS id, j.nombre AS nombre, p.nombre AS categoria " +
            "FROM equipo j, categoria p WHERE j.categoria_id = p.id" //ORDER BY fecha ASC
        );

        int i = 0;
        while (rs.next()) {
            datos[i][0] = String.valueOf(rs.getInt("id"));
            datos[i][1] = rs.getString("nombre");
            datos[i][2] = rs.getString("categoria");
            i++;
        }
        println("Informacion EQUIPO \t-- COMPLETADO");
        return datos;

    } catch (Exception e) {
        println("Error getInfoTablaEquipo");
        e.printStackTrace();
        return null;
    }
}

// Obtener datos de partidos
public String[][] getInfoTablaPartido(){
    int numFilas = getNumRowsTaula("partido");
    int numCols = 17;
    String[][] datos = new String[numFilas][numCols];

    try {
        ResultSet rs = query.executeQuery(
            "SELECT p.id AS id, p.fecha AS fecha, c.nombre AS competicion, " +
            "e1.nombre AS local, e2.nombre AS visitante, " +
            "p.setslocal, p.setsvisitante, " +
            "p.s1local, p.s1visitante, p.s2local, p.s2visitante, " +
            "p.s3local, p.s3visitante, p.s4local, p.s4visitante, p.s5local, p.s5visitante " +
            "FROM partido p, equipo e1, equipo e2, competicion c " +
            "WHERE p.local = e1.id AND p.visitante = e2.id AND p.competicion_id = c.id " +
            "ORDER BY fecha DESC"
        );

        int i = 0;
        while (rs.next()) {
            for (int j = 0; j < numCols; j++) {
                datos[i][j] = rs.getString(j + 1);
            }
            i++;
        }
        println("Informacion PARTIDO \t-- COMPLETADO");
        return datos;

    } catch (Exception e) {
        println("Error getInfoTablaPartido");
        e.printStackTrace();
        return null;
    }
}

// Imprimir matriz 2D
public void printArray2D(String[][] datos){
    for (int i = 0; i < datos.length; i++) {
        for (int j = 0; j < datos[i].length; j++) {
            print(datos[i][j] + "\t");
        }
        println();
    }
}

// Obtener datos de la tabla posicion
public String[] getInfoPosicion(){
    int numFilas = getNumRowsTaula("posicion");
    String[] datos = new String[numFilas];

    try {
        ResultSet rs = query.executeQuery("SELECT nombre FROM posicion");
        int i = 0;
        while (rs.next()) {
            datos[i] = rs.getString("nombre");
            i++;
        }
        println("Informacion POSICION \t-- COMPLETADO");
        return datos;
    } catch (Exception e) {
        println("Error getInfoPosicion");
        e.printStackTrace();
        return null;
    }
}

// Insertar en tabla posicion
public void insertPosicion(String nombre){
    try {
        String q = "INSERT INTO posicion (nombre) VALUES ('" + nombre + "')";
        query.execute(q);
        println("INSERT OK :)");
    } catch (Exception e) {
        println("Error insertPosicion");
        e.printStackTrace();
    }
}

// Actualizar unidad
public void updateUnitat(int id, String nuevoNombre){
    try {
        String q = "UPDATE unitat SET nom = '" + nuevoNombre + "' WHERE numero = " + id;
        query.execute(q);
        println("UPDATE OK :)");
    } catch (Exception e) {
        println("Error updateUnitat");
        e.printStackTrace();
    }
}

// Eliminar unidad
public void deleteUnitat(String nombre){
    try {
        String q = "DELETE FROM unitat WHERE nom = '" + nombre + "'";
        query.execute(q);
        println("DELETE OK :)");
    } catch (Exception e) {
        println("Error deleteUnitat");
        e.printStackTrace();
    }
}

// Formatear fecha (YYYY-MM-DD -> DD/MM/YYYY)
public String formataFechaEsp(String fecha){
    String[] partes = fecha.split("-");
    return partes[2] + "/" + partes[1] + "/" + partes[0];
}

void insertaJugador(String n, String d, String s){
  
  try {
        String q = " INSERT INTO `jugador` (`id`, `nombre`, `dorsal`, `equipo`, `posicion_id`) VALUES (NULL, '"+n+"', '"+d+"', 1, '"+s+"')";
        println("INSERT: "+q);
        query.execute(q);
        println("INSERT OK :)");
    }
    catch(Exception e) {
        System.out.println(e);
    }

}
 