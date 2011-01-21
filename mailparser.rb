require 'sinatra'
require 'dm-core'
require 'parser'
require 'mail_header_key'
require 'output_info'
require 'main'

get '/' do
  
  main =Mian.new
  #mail.txt is a file in the root of project
  outputinfo = main.parser('mail.txt')
    @companyURL = outputinfo.companyURL
    @correctEmail = outputinfo.correctEmail
    @emailServer = outputinfo.emailServer
    @softwreVersion = outputinfo.softwreVersion
    @securitySoftware = outputinfo.securitySoftware
    @headerContents = outputinfo.headerContents
    @firstlastname = outputinfo.firstlastname
    @flastname = outputinfo.flastname
    @nameConflics = outputinfo.nameConflics
    @micrsoftExchange = outputinfo.micrsoftExchange
    @micrsoftExchangeV4 = outputinfo.micrsoftExchangeV4
    @micrsoftExchangeV5 = outputinfo.micrsoftExchangeV5
    @micrsoftExchangeV55 = outputinfo.micrsoftExchangeV55
    @micrsoftExchangeV6 = outputinfo.micrsoftExchangeV6
    @micrsoftExchangeV65 = outputinfo.micrsoftExchangeV65
    @micrsoftExchangeV8 = outputinfo.micrsoftExchangeV8
    @lotusNotesDominio = outputinfo.lotusNotesDominio
    @lotusNotesDominioVersion = outputinfo.lotusNotesDominioVersion
    @novellGrouwpise = outputinfo.novellGrouwpise
    @novellGrouwpiseVersion = outputinfo.novellGrouwpiseVersion
    @googleApps = outputinfo.googleApps
    @other = outputinfo.other
    @softwareTypeConflict = outputinfo.softwareTypeConflict
    @softwareVersionConflict = outputinfo.softwareVersionConflict
    @companyConflictEmailFormat = outputinfo.companyConflictEmailFormat
    @companyConflictEmailServerType = outputinfo.companyConflictEmailServerType
    @companyConflictSoftwareVersion = outputinfo.companyConflictSoftwareVersion
    @companyConflictSecuritySoftware = outputinfo.companyConflictSecuritySoftware
  
  erb :index
end



__END__

@@ index
<html>
  <head>
    <title>Shoutout!</title>
  </head>
  <body style="font-family: sans-serif;">
    <h1>Mail Header Parser!</h1>
    

 <table border="1">

            <tr>
                <td>Company URL</td>
                <td>Correct email format</td>
                <td>Email Server Type</td>
                <td>Software Version</td>
                <td>Security Software</td>
                <td>Header Contents</td>
                <td>firstname.lastname</td>
                <td>flastname</td>
                <td>Name conflicts</td>
                <td>Microsoft Exchange</td>
                <td>Microsoft Exchange V4</td>
                <td>Microsoft Exchange V5.0</td>
                <td>Microsoft Exchange V5.5</td>
                <td>Microsoft Exchange V6.0</td>
                <td>Microsoft Exchange V6.5</td>
                <td>Microsoft Exchange V8</td>
                <td>Lotus Notes / Dominio</td>
                <td>Lotus Notes / Domino version</td>
                <td>Novell Grouwpise</td>
                <td>Novell Groupwise version</td>
                <td>Google Apps</td>
                <td>Other</td>
                <td>Software TypeConflict</td>
                <td>Software Version Conflict</td>
                <td>Company Conflict email format</td>
                <td>Company Conflict Email Server Type</td>
                <td>Company Conflict Software Version</td>
                <td>Company Conflict Security Software</td>

            </tr>
<tr>
<td> <q><%= @companyURL %></q></td>
<td> <q><%= @correctEmail %></q></td>
<td> <q><%= @emailServer %></q></td>
<td> <q><%= @softwreVersion %></q></td>
<td> <q><%= @securitySoftware %></q></td>
<td> <q><%= @headerContents %></q></td>
<td> <q><%= @firstlastname %></q></td>
<td> <q><%= @flastname %></q></td>
<td> <q><%= @nameConflics %></q></td>
<td> <q><%= @micrsoftExchange %></q></td>
<td> <q><%= @micrsoftExchangeV4 %></q></td>
<td> <q><%= @micrsoftExchangeV5 %></q></td>
<td> <q><%= @micrsoftExchangeV55 %></q></td>
<td> <q><%= @micrsoftExchangeV6 %></q></td>
<td> <q><%= @micrsoftExchangeV65 %></q></td>
<td> <q><%= @micrsoftExchangeV8 %></q></td>
<td> <q><%= @lotusNotesDominio %></q></td>
<td> <q><%= @lotusNotesDominioVersion %></q></td>
<td> <q><%= @novellGrouwpise  %></q></td>         
<td> <q><%= @novellGrouwpiseVersion %></q></td>
<td> <q><%= @googleApps %></q></td>
<td> <q><%= @other %></q></td>
<td> <q><%= @softwareTypeConflict %></q></td>
<td> <q><%= @softwareVersionConflict %></q></td>
<td> <q><%= @companyConflictEmailFormat %></q></td>
<td> <q><%= @companyConflictEmailServerType %></q></td>
<td> <q><%= @companyConflictSoftwareVersion %></q></td>
<td> <q><%= @companyConflictSecuritySoftware %></q></td>

</tr>
        </table>
    

  </body>
</html>