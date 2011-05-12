package businesslogic_lab04;

import java.sql.*;
import java.util.*;

public class DatabaseBean
{
	private String queryString = "empty";
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet queryResults = null;
	@SuppressWarnings("rawtypes")
	private Vector vRows = null;
	@SuppressWarnings("rawtypes")
	private Vector headers = null;
	private String url = "";

	public DatabaseBean(){}
	
	public void setURL(String url)
	{
		this.url = url;
	}
	
	public String getURL()
	{
		return (url);
	}

	public void connect(Properties props)
	{
		try {
			Class.forName( props.getProperty("Driver") );
			con = DriverManager.getConnection( props.getProperty("URL"), props );

		} catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch(SQLException ex) {
			ex.printStackTrace();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public String getQueryString()
	{
		return queryString;
	}

	public void setQueryString(String qs)
	{
		queryString = qs;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void runQuery()
	{
		vRows = new Vector();
		int numCols;

		try {
			stmt = con.createStatement();

			queryResults = stmt.executeQuery (queryString);
			ResultSetMetaData meta = queryResults.getMetaData();
			numCols = meta.getColumnCount();

			while (queryResults.next()) {
				Vector vOneRow = new Vector();
				for (int ndx=1; ndx<=numCols; ndx++) {
					vOneRow.addElement(queryResults.getString(ndx));
				}
				vRows.addElement(vOneRow);
			}

		} catch(SQLException ex) {
			ex.printStackTrace();
		} 
		
	}

	@SuppressWarnings("rawtypes")
	public Vector getResultSet() {

		return vRows;
	}

	public void setResultSet(ResultSet rs)
	{
		queryResults = rs;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void generateMetaData() throws SQLException {

		ResultSetMetaData rsmd = queryResults.getMetaData();
		int columnCount = rsmd.getColumnCount();

		headers = new Vector();
        for ( int i = 1; i <= columnCount; i++) {
			headers.add(rsmd.getColumnName(i));
        }
	}


	@SuppressWarnings("rawtypes")
	public Vector getColumnHeaders() {

		return headers;
	}

	public void cleanUp()
	{
		try {
			con.close();
			stmt.close();
		}catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
	}
}

