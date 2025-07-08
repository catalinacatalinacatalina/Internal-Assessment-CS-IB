import processing.core.PApplet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

String user     = "admin";
String pass     = "12345";
String database = "voley";
Connection con;
Statement query;

// Conexión a la BBDD
public void connectBBDD(){
    try {
        con= DriverManager.getConnection("jdbc:mysql://localhost:8889/"+database, user, pass);
        query = con.createStatement();
        System.out.println("Database \t-- connected");
    }
    catch(Exception e) {
        println("Database \t-- error");
        System.out.println(e);
    }
}

//getter para n filas de una tabla
public int getNumRowsTaula(String nomTaula){
    try {
        ResultSet rs = query.executeQuery( "SELECT COUNT(*) AS n FROM "+ nomTaula );
        rs.next();
        int numRows = rs.getInt("n");
        return numRows;
    }
    catch(Exception e) {
        System.out.println(e);
        return 0;
    }
}

// Getter datos tabla
// CANVIAR DADES, AFEGIR QUADRANT QUE POSI PRIMERA I SEGONA POSICIÓ, FER QUERY.
public String[][] getInfoTablaJugadores(){
    int numFilas = getNumRowsTaula("jugador");
    int numCols  = 3;
    
    String[][] informacionJugadores = new String[numFilas][numCols];
    try {
        ResultSet rs = query.executeQuery( "SELECT j.nombre AS nombre, j.dorsal AS dorsal, p.nombre AS posicion FROM jugador j, posicion p WHERE j.posicion_id=p.id");
        int nr = 0;
        while (rs.next()) {
            informacionJugadores[nr][1] = rs.getString("nombre");
            informacionJugadores[nr][0] = String.valueOf(rs.getInt("dorsal"));
            informacionJugadores[nr][2] = rs.getString("posicion");

            nr++;
        }
        println("Información JUGADORES \t-- COMPLETADO");
        //printArray2D(informacionJugadores);
        return informacionJugadores;
    }
    catch(Exception e) {
        println("Información JUGADORES \t-- ERROR");
        System.out.println(e);
        return null;
    }
}

public String[][] getInfoTablaEquipo(){
    int numFilas = getNumRowsTaula("equipo");
    int numCols  = 3;
    
    String[][] equipoInfo = new String[numFilas][numCols];
    try {
        ResultSet rs = query.executeQuery( "SELECT j.id AS id, j.nombre AS nombre, p.nombre AS categoria FROM equipo j, categoria p WHERE j.categoria_id=p.id ORDER BY `fecha` ASC");
        int nr = 0;
        while (rs.next()) {
            equipoInfo[nr][0] = String.valueOf(rs.getInt("id"));
            equipoInfo[nr][1] = rs.getString("nombre");
            equipoInfo[nr][2] = rs.getString("categoria");
            nr++;
        }

        println("Información EQUIPO \t-- COMPLETADO");
        //printArray2D(equipoInfo);
        return equipoInfo;
    }
    catch(Exception e) {
        println("Información EQUIPO \t-- ERROR");

        System.out.println(e);
        return null;
    }
}

public String[][] getInfoTablaPartido(){
    int numFilas = getNumRowsTaula("partido");
    int numCols  = 17;
    
    String[][] infoPartido = new String[numFilas][numCols];
    try {
        ResultSet rs = query.executeQuery( "SELECT p.id AS id, p.fecha AS fecha, c.nombre AS competicion, e1.nombre AS local, e2.nombre AS visitante, p.setslocal AS setslocal, p.setsvisitante AS setsvisitante, p.s1local AS s1local, p.s1visitante AS s1visitante, p.s2local AS s2local, p.s2visitante AS s2visitante, p.s3local AS s3local, p.s3visitante AS s3visitante, p.s4local AS s4local, p.s4visitante AS s4visitante, p.s5local AS s5local, p.s5visitante AS s5visitante FROM partido p , equipo e1, equipo e2, competicion c WHERE p.local=e1.id AND p.visitante=e2.id AND p.competicion_id=c.id ORDER BY `fecha` DESC");
        int nr = 0;
        while (rs.next()) {
            infoPartido[nr][0]  = String.valueOf(rs.getInt("id"));
            infoPartido[nr][1]  = String.valueOf(rs.getDate("fecha"));
            infoPartido[nr][2]  = rs.getString("competicion");

            infoPartido[nr][3]  = rs.getString("local");
            infoPartido[nr][4]  = rs.getString("visitante");

            infoPartido[nr][5]  = String.valueOf(rs.getInt("setslocal"));
            infoPartido[nr][6]  = String.valueOf(rs.getInt("setsvisitante"));
            infoPartido[nr][7]  = String.valueOf(rs.getInt("s1local"));
            infoPartido[nr][8]  = String.valueOf(rs.getInt("s1visitante"));
            infoPartido[nr][9]  = String.valueOf(rs.getInt("s2local"));
            infoPartido[nr][10] = String.valueOf(rs.getInt("s2visitante"));
            infoPartido[nr][11] = String.valueOf(rs.getInt("s3local"));
            infoPartido[nr][12] = String.valueOf(rs.getInt("s3visitante"));
            infoPartido[nr][13] = String.valueOf(rs.getInt("s4local"));
            infoPartido[nr][14] = String.valueOf(rs.getInt("s4visitante"));
            infoPartido[nr][15] = String.valueOf(rs.getInt("s5local"));
            infoPartido[nr][16] = String.valueOf(rs.getInt("s5visitante"));
            nr++;
        }
        println("Información PARTIDO \t-- COMPLETADO");
        //printArray2D(infoPartido);
        return infoPartido;
    }
    catch(Exception e) {
        println("Información JUGADORES \t-- ERROR");
        System.out.println(e);
        return null;
    }
}

//imprimir contenido array en dos dimensiones
public void printArray2D(String[][] dades){
    println("\nTabla " + dades);
    for(int f=0; f<dades.length; f++){
        for(int c=0; c<dades[f].length; c++){
            print(dades[f][c]+" \t ");
        }
        println();
    }
}
public String[] getInfoPosicion(){
    int numFilas = getNumRowsTaula("posicion");
    int numCols  = 2;
    
    String[] informacionPosicion = new String[numFilas];
    try {
        ResultSet rs = query.executeQuery( "SELECT * FROM `posicion`");
        int nr = 0;
        while (rs.next()) {
            informacionPosicion[nr] = rs.getString("nombre");
            //informacionPosicion[nr] = String.valueOf(rs.getInt("id"));

            nr++;
        }
        println("Información POSICION \t-- COMPLETADO");
        //printArray2D(informacionPosicion);
        return informacionPosicion;
    }
    catch(Exception e) {
        println("Información Posicion \t-- ERROR");
        System.out.println(e);
        return null;
    }
}

// Insertar nuevos datos tabla posición
public void insertPosicion( String n){
    try {
        String q = "INSERT INTO posicion (id,nombre) VALUES (NULL, '"+n+"')";
        println("INSERT: "+q);
        query.execute( q);
        println("INSERT OK :)");
    }
    catch(Exception e) {
        System.out.println(e);
    }
}

// Actualitzar datos tabla
public void updateUnitat(int id, String n){
    try {
        String q = "UPDATE unitat SET nom='"+n+"' WHERE numero='"+id+"'";
        println("UPDATE: "+q);
        query.execute( q);
        println("UPDATE OK :)");
    }
    catch(Exception e) {
        System.out.println(e);
    }
}

// Eliminar dato tabla
public void deleteUnitat(String n){
    try {
        String q = "DELETE FROM unitat WHERE nom='"+n+"'";
        println("DELETE: "+q);
        query.execute( q);
        println("DELETE OK :)");
    }
    catch(Exception e) {
        System.out.println(e);
    }
}

String formataFechaEsp(String fechaEntrada){
   
  String y = fechaEntrada.split("-")[0];
  String m = fechaEntrada.split("-")[1];
  String d = fechaEntrada.split("-")[2];
  
  return d+"/"+m+"/"+y;
}