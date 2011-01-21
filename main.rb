
require "output_info"
require "parser"

class Mian

  def parser(path)
    outputinfo = OutputInfo.new

    outputinfo.headerContents = Parser.get_header_contents(path)

    mail_info_string = Parser.get_string(path)

    outputinfo.companyURL = Parser.get_company_url(path)

    outputinfo.firstlastname = Parser.get_first_last_name(path)

    outputinfo.flastname = Parser.get_flast_name(path)

    outputinfo.nameConflics = Parser.get_name_conflics(outputinfo)

    outputinfo.googleApps = Parser.get_googleapps(path)

    outputinfo.correctEmail = Parser.get_correct_email(outputinfo)

    outputinfo.lotusNotesDominio = Parser.get_lotus_notes_dominio(mail_info_string)

    if outputinfo.lotusNotesDominio == 'TRUE'
      outputinfo.lotusNotesDominioVersion = Parser.get_lotus_notes_dominio_version(path)
    else
      outputinfo.lotusNotesDominioVersion = 'NULL'
    end


    outputinfo.micrsoftExchange = Parser.get_micrsoft_exchange(mail_info_string)

    outputinfo.micrsoftExchangeV4 = Parser.get_micrsoft_exchange_v4(mail_info_string)

    outputinfo.micrsoftExchangeV5 = Parser.get_micrsoft_exchange_v5(mail_info_string)

    outputinfo.micrsoftExchangeV55 = Parser.get_micrsoft_exchange_v55(mail_info_string)

    outputinfo.micrsoftExchangeV6 = Parser.get_micrsoft_exchange_v6(mail_info_string)

    outputinfo.micrsoftExchangeV65 = Parser.get_micrsoft_exchange_v65(mail_info_string)

    outputinfo.micrsoftExchangeV8 = Parser.get_micrsoft_exchange_v8(mail_info_string)

    outputinfo.novellGrouwpise = Parser.get_novell_grouwpise(mail_info_string)

    if outputinfo.novellGrouwpise == 'TRUE'
      outputinfo.novellGrouwpiseVersion = Parser.get_novell_grouwpise_version(path)
    else
      outputinfo.novellGrouwpiseVersion = 'NULL'
    end

    outputinfo.other = Parser.get_other(mail_info_string)

    outputinfo.securitySoftware = Parser.get_security_software(mail_info_string)

    outputinfo.softwareTypeConflict = Parser.get_software_type_conflict(outputinfo)

    if outputinfo.softwareTypeConflict == 'FALSE'
      outputinfo.emailServer = Parser.get_email_server(outputinfo)
    end

    outputinfo.softwareVersionConflict = Parser.get_software_version_conflict(outputinfo)

    if outputinfo.softwareVersionConflict == 'FALSE'
      outputinfo.softwreVersion = Parser.get_softwre_version(outputinfo)
    end

    outputinfo

  end



end








