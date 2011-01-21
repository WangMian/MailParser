
class Parser
  def initialize
    
  end

  def Parser.get_string(path)
    message = ''
    File.open(path,'r') do |f1|

      while line = f1.gets

        message = message + line

      end

    end

    message
  end

  def Parser.get_header_contents(path)
    message = ''
    File.open(path.to_s,'r') do |f1|

      while line = f1.gets

        if line.empty? or line == "\r\n" or line =="\n"
          return message
        end
        
        message = message + line
      end

    end

    message
    
  end

  def Parser.get_company_url(path)
    File.open(path,'r') do |f1|

    
      while line = f1.gets

        if line.include?('From:')
        
          lines = line.split('<')
     
          liness = lines[1].split('>')
     
          company_regex=/^[a-zA-Z0-9_]*@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*(\.[a-zA-Z]{2,3})$/
          #            firstname_lastname_regex=/^[_a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*(\.[a-zA-Z]{2,3})$/
          email = liness[0].match(company_regex)
          if email != nil
            return email[0].sub(/^[a-zA-Z0-9_]*@/, 'www.')
          end
         
        end

      end

    end
    return ''
  end

  def Parser.get_correct_email(outputinfo)
    
    if outputinfo.firstlastname == 'FALSE' and outputinfo.flastname == 'FALSE'
      return 'UNKNOWN'
    end

    if outputinfo.nameConflics == 'TRUE'
      return ''
    end

    if outputinfo.firstlastname == 'FALSE'
      return outputinfo.flastname
    end

    if  outputinfo.flastname =='FALSE'
      return outputinfo.firstlastname
    end

    return ''
  end
  
  def Parser.get_softwre_version(outputinfo)

    if outputinfo.micrsoftExchangeV4 == 'TRUE'
      return 'V4'
    end

    if outputinfo.micrsoftExchangeV5 =='TRUE'
      return 'V5'
    end

    if outputinfo.micrsoftExchangeV55 == 'TRUE'
      return 'V55'
    end

    if outputinfo.micrsoftExchangeV6 == 'TRUE'
      return 'V6'
    end

    if outputinfo.micrsoftExchangeV65 =='TRUE'
      return 'V65'
    end

    if outputinfo.micrsoftExchangeV8 =='TRUE'
      return 'V8'
    end
    if outputinfo.lotusNotesDominioVersion !='NULL' and outputinfo.lotusNotesDominioVersion !='UNKNOWN'
      return outputinfo.lotusNotesDominioVersion
    end

    if outputinfo.novellGrouwpiseVersion !='NULL' and  outputinfo.novellGrouwpiseVersion !='UNKNOWN'
      return outputinfo.novellGrouwpiseVersion 
    end

    ''
  end

  def Parser.get_security_software(header)
    if header.include?('X-Mailer: Websense') or  header.include?('E-mail Filter')
      return 'Websense'
    end

    if header.include?('Xwall')
      return 'Xwall'
    end

    return ''
  end

  def Parser.get_first_last_name(path)
    File.open(path,'r') do |f1|

      while line = f1.gets

        if line.include?('From:')

          #          if line.include('552')
          #            return 'TRUE'
          #          end

          lines = line.split('<')

          liness = lines[1].split('@')

          company_regex=/^[a-zA-Z]+\.[a-zA-Z]+$/
          #            firstname_lastname_regex=/^[_a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*(\.[a-zA-Z]{2,3})$/
          email = liness[0].match(company_regex)
          if email != nil
            return email[0]
          else
            return 'FALSE'
          end

          if line.include?('failure') or  line.include?('failed')
            return 'FALSE'
          end

        end
        if line.include?('SMTP')
          if line.include?('550') or line.include?('551') or line.include?('553') or line.include?('554')
            return 'FALSE'
          end
        end
      end

    end
    return 'UNKNOWN'
  end

  def Parser.get_flast_name(path)
    File.open(path,'r') do |f1|

      while line = f1.gets

        if line.include?('From:')

          #          if line.include('552')
          #            return 'TRUE'
          #          end

          lines = line.split('<')

          liness = lines[1].split('@')

          company_regex=/^[a-zA-Z]+$/
          #            firstname_lastname_regex=/^[_a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*(\.[a-zA-Z]{2,3})$/
          email = liness[0].match(company_regex)
          if email != nil
            return email[0]
          else
            return 'FALSE'
          end

          if line.include('failure') or  line.include('failed')
            return 'FALSE'
          end

          if line.include('SMTP')
            if line.include('550') or line.include('551') or line.include('553') or line.include('554')

              return 'FALSE'
            end

          end

        end

      end

    end
    return 'UNKNOWN'
  end

  def Parser.get_name_conflics(outputinfo)
    if outputinfo.firstlastname == 'TRUE' and outputinfo.flastname == 'TRUE'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_micrsoft_exchange(header)
    if header.include?'microsoft' or  header.include?'exchange' or  header.include?'MimeOLE'  or  header.include?'Xwall'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_micrsoft_exchange_v4(header)

    if header.include?'exchange 4.0' or  header.include?'exchange 4' or  header.include?'exchange v4.0'  or  header.include?'exchange v4' or  header.include?'MimeOLE V4'
      return 'TRUE'
    end
    return 'FALSE'

  end

  def Parser.get_micrsoft_exchange_v5(header)

    if header.include?'exchange 5.0' or  header.include?'exchange 5' or  header.include?'exchange v5.0'  or  header.include?'exchange v5' or  header.include?'MimeOLE V5'
      return 'TRUE'
    end
    return 'FALSE'

  end

  def Parser.get_micrsoft_exchange_v55(header)

    if header.include?'exchange 5.5' or  header.include?'exchange v5.5'  or  header.include?'MimeOLE V5.5'
      return 'TRUE'
    end
    return 'FALSE'

  end

  def Parser.get_micrsoft_exchange_v6(header)
    if header.include?'exchange 6.0' or  header.include?'exchange 6' or  header.include?'exchange v6.0'  or  header.include?'exchange v6' or  header.include?'MimeOLE V6'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_micrsoft_exchange_v65(header)
    if header.include?'exchange 6.5' or  header.include?'exchange v6.5'  or  header.include?'MimeOLE V6.5'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_micrsoft_exchange_v8(header)
    if header.include?'exchange v8.0' or  header.include?'exchange v8' or  header.include?'Exchange Server 2007'  or  header.include?'microsoft 2007' or  header.include?'MimeOLE V8'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_lotus_notes_dominio(header)

    if header.include?'notes' or  header.include?'Lotus'  or  header.include?'Domino'
      return 'TRUE'
    end
    return 'FALSE'

  end

  def Parser.get_lotus_notes_dominio_version(path)
  
    File.open(path.to_s,'r') do |f1|

      while line = f1.gets
        if line.downcase.include?('domino release')
          return line[ line.downcase.index('domino release')+14,6]
        end
      end

    end

    'UNKNOWN'

  end

  def Parser.get_novell_grouwpise(header)
    if header.include?'groupwise' or  header.include?'Novell'
      return 'TRUE'
    end
    return 'FALSE'
  end

  def Parser.get_novell_grouwpise_version(path)
    File.open(path.to_s,'r') do |f1|

      while line = f1.gets
        if line.downcase.include?('GroupWise Internet Agent')
          return line[ line.downcase.index('GroupWise Internet Agent')+24,6]
        end
      end

    end

    'UNKNOWN'
  end

  def Parser.get_googleapps(path)

    File.open(path.to_s,'r') do |f1|

      while line = f1.gets
        
        if line.include?('Message-ID') and line.include?('mail.gmail.com')
          return 'TRUE'
        end
       
      end

    end

    return 'FALSE'
  end

  def Parser.get_other(header)
    if header.include?('X-Mailer: FirstClass')
      return 'FirstClass'
    end

    if header.include?('Tumbleweed')
      return 'Tumbleweed'
    end

    if header.include?('Yahoo')
      return 'Yahoo'
    end

    if header.include?('Apple')
      return 'Apple'
    end

    return 'FALSE'
  end

  def Parser.get_software_type_conflict(outputinfo)

    sum =0

    if outputinfo.micrsoftExchange == 'TRUE'
      sum = sum +1
    end
    
    if outputinfo.lotusNotesDominio =='TRUE'
      sum = sum +1
    end

    if outputinfo.googleApps == 'TRUE'
      sum = sum+1
    end

    if outputinfo.other == 'TRUE'
      sum = sum +1
    end

    if outputinfo.novellGrouwpise =='TRUE'
      sum = sum +1
    end
    
    if sum >1
      return 'TRUE'
    end

    return 'FALSE'

  end

  def Parser.get_email_server(outputinfo)
    
    if outputinfo.micrsoftExchange == 'TRUE'
      return 'Micrsoft Exchange'
    end

    if outputinfo.lotusNotesDominio =='TRUE'
      return 'Lotus Notes / Dominio'
    end

    if outputinfo.googleApps == 'TRUE'
      return 'Google Apps'
    end

    if outputinfo.other == 'TRUE'
      return 'Other'
    end

    if outputinfo.novellGrouwpise =='TRUE'
      return 'Novell Grouwpise'
    end
    
    ''
  end
  
  def Parser.get_software_version_conflict(outputinfo)
    sum =0

    if outputinfo.micrsoftExchangeV4 == 'TRUE'
      sum = sum +1
    end

    if outputinfo.micrsoftExchangeV5 =='TRUE'
      sum = sum +1
    end

    if outputinfo.micrsoftExchangeV55 == 'TRUE'
      sum = sum+1
    end

    if outputinfo.micrsoftExchangeV6 == 'TRUE'
      sum = sum +1
    end

    if outputinfo.micrsoftExchangeV65 =='TRUE'
      sum = sum +1
    end

    if outputinfo.micrsoftExchangeV8 =='TRUE'
      sum = sum +1
    end
    if outputinfo.lotusNotesDominioVersion !='NULL' and outputinfo.lotusNotesDominioVersion !='UNKNOWN'
      sum = sum +1
    end

    if outputinfo.novellGrouwpiseVersion !='NULL' and  outputinfo.novellGrouwpiseVersion !='UNKNOWN'
      sum = sum +1
    end

    if sum >1
      return 'TRUE'
    end

    return 'FALSE'
  end

  def Parser.get_company_conflict_email_format(header)

    header
  end

  def Parser.get_company_conflict_email_server_type(header)

    header
  end

  def Parser.get_company_conflict_software_version(header)

    header
  end

  def Parser.get_company_conflict_security_software(header)

  end

end
