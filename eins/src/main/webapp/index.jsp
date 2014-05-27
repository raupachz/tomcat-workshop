<%@page import="java.lang.management.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%!
    OperatingSystemMXBean os = ManagementFactory.getOperatingSystemMXBean();
    MemoryMXBean memory = ManagementFactory.getMemoryMXBean();
    RuntimeMXBean runtime = ManagementFactory.getRuntimeMXBean();
    ThreadMXBean threads = ManagementFactory.getThreadMXBean();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Real time data</title>
        <link rel="stylesheet" href="css/bootstrap-3.1.1.min.css">
        <link rel="stylesheet" href="css/layout.css">
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1>Real time data</h1>
                <p class="lead">Monitor your servlet container in real time! All the data is gathered from ServletContext, HttpServletRequest and Java Management Extensions (JMX).</p>
                <p><a class="btn btn-lg btn-success" href="" role="button">Refresh</a></p>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <h4>Servlet Context</h4>
                    <table class="table">
                        <tr>
                            <td>Context path:</td><td>${pageContext.servletContext.contextPath}</td>
                        </tr>
                        <tr>
                            <td>Server info:</td><td>${pageContext.servletContext.serverInfo}</td>
                        </tr>
                        <tr>
                            <td>Major version:</td><td>${pageContext.servletContext.majorVersion}</td>
                        </tr>
                        <tr>
                            <td>Minor version:</td><td>${pageContext.servletContext.minorVersion}</td>
                        </tr>
                        <tr>
                            <td>Effective major version:</td><td>${pageContext.servletContext.effectiveMajorVersion}</td>
                        </tr>
                        <tr>
                            <td>Effective minor version:</td><td>${pageContext.servletContext.effectiveMinorVersion}</td>
                        </tr>
                    </table>

                </div>
                <div class="col-lg-4">
                    <h4>HTTP Servlet Request</h4>
                    <table class="table">
                        <tr>
                            <td>Method:</td><td><%= request.getMethod()%></td>
                        </tr>
                        <tr>
                            <td>Request URL:</td><td><%= request.getRequestURL()%></td>
                        </tr>
                        <tr>
                            <td>Request URI:</td><td><%= request.getRequestURI()%></td>
                        </tr>
                        <tr>
                            <td>Query string:</td><td><%= request.getQueryString()%></td>
                        </tr>
                        <tr>
                            <td>Servlet path:</td><td><%= request.getServletPath()%></td>
                        </tr>
                        <tr>
                            <td>Authentication scheme:</td><td><%= request.getAuthType()%></td>
                        </tr>
                        <tr>
                            <td>Remote user:</td><td><%= request.getRemoteUser()%></td>
                        </tr>
                    </table>

                </div>
                <div class="col-lg-4">
                </div>
            </div>
            <h1 class="page-header text-center">Cookies</h1> 
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Domain</th>
                        <th>Path</th>
                        <th>Max age</th>
                        <th>HTTP</th>
                        <th>Secure</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${cookie}">
                        <tr>
                            <td>${c.value.name}</td>
                            <td>${c.value.value}</td>
                            <td>${c.value.domain}</td>
                            <td>${c.value.path}</td>
                            <td>${c.value.maxAge}</td>
                            <td>${c.value.httpOnly}</td>
                            <td>${c.value.secure}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <h1 class="page-header text-center">Java Management Extensions (JMX)</h1>
            <div class="row">
                <div class="col-lg-4">
                    <h4>Operating System</h4>
                    <table class="table table-striped">
                        <tr>
                            <td>Name:</td><td><%= os.getName()%></td>
                        </tr>
                        <tr>
                            <td>Architecture:</td><td><%= os.getArch()%></td>
                        </tr>
                        <tr>
                            <td>Version</td><td><%= os.getVersion()%></td>
                        </tr>
                        <tr>
                            <td>Available processors:</td><td><%= os.getAvailableProcessors()%></td>
                        </tr>
                        <tr>
                            <td>System load average:</td><td><%= os.getSystemLoadAverage()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-4">
                    <h4>Memory</h4>
                    <table class="table table-striped">
                        <tr>
                            <td>Maximum heap memory:</td><td><%= memory.getHeapMemoryUsage().getMax()%></td>
                        </tr>
                        <tr>
                            <td>Initial heap memory:</td><td><%= memory.getHeapMemoryUsage().getInit()%></td>
                        </tr>
                        <tr>
                            <td>Used heap memory:</td><td><%= memory.getHeapMemoryUsage().getUsed()%></td>
                        </tr>
                        <tr>
                            <td>Free heap memory:</td><td><%= memory.getHeapMemoryUsage().getMax() - memory.getHeapMemoryUsage().getUsed()%></td>
                        </tr>
                        <tr>
                            <td>Committed heap memory:</td><td><%= memory.getHeapMemoryUsage().getCommitted()%></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-4">
                    <h4>Runtime</h4>
                    <table class="table table-striped">
                        <tr>
                            <td>Name:</td><td><%= runtime.getName()%></td>
                        </tr>
                        <tr>
                            <td>Specification name</td><td><%= runtime.getSpecName()%></td>
                        </tr>
                        <tr>
                            <td>Specification vendor</td><td><%= runtime.getSpecVendor()%></td>
                        </tr>
                        <tr>
                            <td>Specification version</td><td><%= runtime.getSpecVersion()%></td>
                        </tr>
                        <tr>
                            <td>Start time</td><td><%= runtime.getStartTime()%></td>
                        </tr>
                        <tr>
                            <td>Uptime</td><td><%= runtime.getUptime()%></td>
                        </tr>
                        <tr>
                            <td>VM name</td><td><%= runtime.getVmName()%></td>
                        </tr>
                        <tr>
                            <td>VM vendor</td><td><%= runtime.getVmVendor()%></td>
                        </tr>
                        <tr>
                            <td>VM version</td><td><%= runtime.getVmVersion()%></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <h4>Threads</h4>
                    <table class="table table-striped">
                        <tr>
                            <td>Live threads</td><td><%= threads.getThreadCount() %></td>
                        </tr>
                        <tr>
                            <td>Live daemon threads</td><td><%= threads.getDaemonThreadCount() %></td>
                        </tr>
                        <tr>
                            <td>Live peak threads</td><td><%= threads.getPeakThreadCount() %></td>
                        </tr>
                        <tr>
                            <td>Total started threads</td><td><%= threads.getTotalStartedThreadCount() %></td>
                        </tr>
                    </table>
                </div>
                <div class="col-lg-4">

                </div>
                <div class="col-lg-4">

                </div>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap-3.1.1.min.js"></script>
    </body>
</html>

