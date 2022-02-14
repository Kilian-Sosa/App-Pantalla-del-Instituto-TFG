public class ThisConnection {
    private static final String JDBC_DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private static final String JDBC_CON_DATABASE = "jdbc:mysql://83.37.135.236/Chromium69";
    private static final String JDBC_CON_USER = "chromium69";
    private static final String JDBC_CON_PASSWORD = "root";
    private static Connection con = null;
        
    public ThisConnection(){
        //Create the connection with the DataBase
        try {
            Class.forName(JDBC_DRIVER_CLASS);
            con = DriverManager.getConnection(JDBC_CON_DATABASE, JDBC_CON_USER, JDBC_CON_PASSWORD);     
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el driver: " + ex);
        } catch (SQLException ex) {
            System.out.println("Error al cargar la base de datos: " + ex);
        }
    }
        
    public Connection getConnection(){
        return con;
    }
}       
