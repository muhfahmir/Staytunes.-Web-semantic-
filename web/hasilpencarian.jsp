<%@ page import="com.hp.hpl.jena.rdf.model.ModelFactory" %>
<%@ page import="com.hp.hpl.jena.ontology.OntModel" %>
<%@ page import="com.hp.hpl.jena.ontology.OntModelSpec" %>
<%@ page import="com.hp.hpl.jena.query.ResultSet" %>
<%@ page import="com.hp.hpl.jena.util.FileManager" %>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.*" %>
<%@ page import="org.dom4j.Document" %>
<%@ page import="org.dom4j.Element" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
    <!--<head><link href="css/style.css" rel="stylesheet"></head>-->
    <body>
        <h3 class="search__headerTable">
            <%
                String terkait;
                terkait = request.getParameter("searchInput");
                if (terkait != null) {
                    out.print("Hasil pencarian dari : " + terkait);
                }
            %>
        </h3>
        
            <%! String search = "";
                    ServletContext sc = null;
                    OntModel model = null;
                    mysemantic.sparqlUtil util = new mysemantic.sparqlUtil();
                    String prefix = "";
                    
                    public String readFile(String inputFileName) {
                        String Prefix = "";
                        try {
                            model = ModelFactory.createOntologyModel(OntModelSpec.OWL_MEM_RDFS_INF);
                            InputStream in = FileManager.get().open(sc.getRealPath("/" + inputFileName));
                            if (in == null) {
                                throw new IllegalArgumentException("File : ”+inputFileName +not found");
                            }
                            //akhir dari if
                            model.read(new InputStreamReader(in), "");
                            //  }catch(Exception e){ System.out.println(""+e.getMessage());}
                            Map map = model.getNsPrefixMap();
                            Collection collection = map.values();
                            Iterator it = collection.iterator();
                            for (; it.hasNext();) //mengambil prefix yang digunakan
                            {
                                String ns = it.next().toString();
                                Prefix = model.getNsURIPrefix(ns);
                                if (Prefix != "") {
                                    prefix += "PREFIX " + Prefix + ":";
                                } else {
                                    prefix += "PREFIX " + ": ";
                                }
                                prefix += "<" + ns + ">\r\n";
                            }
                        } //end dari try
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                        return prefix;
                    }
                    
                    private String parseSearchKeys1(String searchText) {

                    String queryString = prefix + "\nPREFIX : <http://www.semanticweb.org/asus/ontologies/2021/0/musiiic.owl#>\n"
                            + "SELECT ?judul  ?penyanyi  ?genre_music ?durasi \n"
                            + "WHERE {{?music_title :singer_name ?penyanyi.}"
                            + " {?music_title :music_titles ?judul.}"
                            + " {?music_title :genre_name ?genre_music.}"
                            + " {?music_title :time ?durasi.}" 
                            + "FILTER(regex(str(?genre_music), '"+searchText+"','i'))";
                    queryString += "} ORDER BY ?judul";
                    return queryString;

                } 
              

                private String parseResult(Document d) {
                    String returnValue;
                    int nomor;
                    List list = d.getRootElement().element("results").elements("result");
                    if (list.size() != 0) {
                        returnValue = "<p>Total hasil pencarian : " + list.size()+"</p>"
                                        +"<thead>"
                                            +"<tr>"
                                                +"<th scope='col'>No</th>"
                                                +"<th scope='col'>Judul</th>"
                                                +"<th scope='col'>Penyanyi</th>"
                                                +"<th scope='col'>Genre</th>"
                                                +"<th scope='col'>Durasi</th>"
                                           +"</tr>"
                                        +"</thead>"
                                        +"<tbody>";
                        //returnValue = "";
                        for (int i = 0; i < list.size(); i++) {
                            nomor = i + 1;
                            returnValue += "<tr>";
                            Element elm = (Element) list.get(i);
                            List column = elm.elements("binding");
                            for (int j = 0; j < column.size(); j++) {
                                Element variable = (Element) column.get(j);
                                String attribute = variable.attributeValue("name");
                                String value = "";

                                if (variable.element("literal") != null) {
                                    value += variable.element("literal").getData().toString();
                                } else if (variable.element("unbound") != null) {
                                    value += "-";
                                }
                                if (attribute.equals("judul")) {
                                    returnValue += "<th >"+nomor+"</th><td>"+value+"</td>";
                                }
                                else if (attribute.equals("penyanyi")) {
                                    returnValue += "<td>"+value+"</td>";
                                } 
                                else if (attribute.equals("genre_music")) {
                                    returnValue += "<td>"+value+"</td>";
                                }
                                
                                else if (attribute.equals("durasi")) {
                                    returnValue += "<td>"+value+" menit</td>";
                                } 
                                else {
                                    returnValue += "<br/><b>" + attribute + "</b>:" + value;
                                }
                            }
                            returnValue += "</tr>";
                        }

                        returnValue += "</ol>";
                    } else {
                        returnValue = " Data tidak ditemukan, silahkan cari dengan kata kunci atau kriteria lain";
                    }
                    return returnValue;

                }
                    public Document displayResult1(PrintWriter out, String searchText) throws Exception {

                    String queryText = parseSearchKeys1(searchText);
                    Document result = util.prepareResult(util.execute(model, queryText), false);
                    return result;
                }
                    %>       
          
          <% long start = System.currentTimeMillis();%>

        <table class="table table-hover search__tableData bg-white" >
            
                    
                <%  response.setContentType("text/html");
                    PrintWriter outs = response.getWriter();
                    sc = getServletConfig().getServletContext();


                    try {
                        search = request.getParameter("searchButton");
                        String searchText = request.getParameter("searchInput");
                        prefix = readFile("musiiic.owl");
                        if (search != null) {
                            if (searchText.equals("")) {
                                String msg = "* Type the keyword...";
                                String alamat = "index.jsp";
                                String str_url = alamat + "?msg=" + msg;
                                response.sendRedirect(str_url);
                            }
                            Document hasil1 = displayResult1(outs, searchText);
                            if (parseResult(hasil1) != null) {
                                out.println(parseResult(hasil1));                                
                            } 
                            else {
                                 out.print("\nMaaf, Data tidak ditemukan ");
                            }

                        }
                    } catch (Exception ex) {
                        out.println("Exception: " + ex);
                        ex.printStackTrace(outs);
                    }
                %>  
                    
            </tbody>
        </table>
                 <% long end = System.currentTimeMillis();%>

        <p>
            <%
                String waktu;
                waktu = request.getParameter("searchInput");
                if (waktu != null) {
                    out.print("Waktu yang diperlukan untuk pencarian musik dengan genre "+waktu+" adalah " + ((end - start) / 1000.0) + " detik");
                }
            %>
        </p>
    </body>
</html>