package a00222500.lab04;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.Vector;

public class sqlutil {
	  
	  public static String getHTMLTable(@SuppressWarnings("rawtypes") Vector tableRows) throws SQLException {
		  StringBuffer htmlRows = new StringBuffer();
		  int count = 0;
		  if(tableRows == null){
			  htmlRows.append("<tr><td>No Data Found</td></tr>");
		  }
		  
		  @SuppressWarnings("rawtypes")
		  Iterator rows = tableRows.iterator();
		  while(rows.hasNext()) {
			  if(count % 2 == 0) {
				  htmlRows.append("<tr bgcolor=\"#C3C3C3\">");
			  } else {
				  htmlRows.append("<tr bgcolor=\"#FFF\">");
			  }
			  @SuppressWarnings("rawtypes")
			  Vector singleRow = (Vector)rows.next();
				@SuppressWarnings("rawtypes")
				Iterator fields = singleRow.iterator();
				while (fields.hasNext()) {
					String field = (String)fields.next();
					htmlRows.append("<TD>" + field + "</TD>");
				}
				htmlRows.append("</TR>\n");
				count++;
		  }
		  htmlRows.append("</tr>");
		  htmlRows.append("</table>");
		  return htmlRows.toString();
	  }
	  
	  public static String addTableHeaders(@SuppressWarnings("rawtypes") Vector headerNames) {
			StringBuffer tableHeaders = new StringBuffer();
			tableHeaders.append("<TABLE border='1'>\n");
			tableHeaders.append("<TR bgcolor=\"#FFDC75\">");
			@SuppressWarnings("rawtypes")
			Iterator headers = headerNames.iterator();
			while (headers.hasNext()) {
				String field = (String)headers.next();
				tableHeaders.append("<TD>" + field + "</TD>");
			}
			tableHeaders.append("</TR>");
			return tableHeaders.toString();

	  }
	
}
