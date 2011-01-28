$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'main'
require 'output_info'

class MainTest < Test::Unit::TestCase

  def test_parser
  
  main =Mian.new
  outputinfo = main.parser('mail.txt')
  
  assert_equal('www.163.com' , outputinfo.companyURL, 'companyURL not equal')
  assert_equal('lovesesame' , outputinfo.correctEmail, 'correctEmail not equal')
  assert_equal('' , outputinfo.emailServer, 'emailServer not equal')
  assert_equal('' , outputinfo.softwreVersion, 'softwreVersion not equal')
  assert_equal('' , outputinfo.securitySoftware, 'securitySoftware not equal')
  assert_equal('FALSE' , outputinfo.firstlastname, 'firstlastname not equal')
  assert_equal('lovesesame' , outputinfo.flastname, 'flastname not equal')
  assert_equal('FALSE' , outputinfo.nameConflics, 'nameConflics not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchange, 'micrsoftExchange not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV4, 'micrsoftExchangeV4 not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV5, 'micrsoftExchangeV5 not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV55, 'micrsoftExchangeV55 not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV6, 'micrsoftExchangeV6 not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV65, 'micrsoftExchangeV65 not equal')
  assert_equal('FALSE' , outputinfo.micrsoftExchangeV8, 'micrsoftExchangeV8 not equal')
  assert_equal('FALSE' , outputinfo.lotusNotesDominio, 'lotusNotesDominio not equal')
  assert_equal('NULL' , outputinfo.lotusNotesDominioVersion, 'lotusNotesDominioVersion not equal')
  assert_equal('FALSE' , outputinfo.novellGrouwpise, 'novellGrouwpise not equal')
  assert_equal('NULL' , outputinfo.novellGrouwpiseVersion, 'novellGrouwpiseVersion not equal')
  assert_equal('FALSE' , outputinfo.googleApps, 'googleApps not equal')
  assert_equal('FALSE' , outputinfo.other, 'other not equal')
  assert_equal('FALSE' , outputinfo.softwareTypeConflict, 'softwareTypeConflict not equal')
  assert_equal('FALSE' , outputinfo.softwareVersionConflict, 'softwareVersionConflict not equal')
  assert_equal(nil , outputinfo.companyConflictEmailFormat, 'companyConflictEmailFormat not equal')
  assert_equal(nil , outputinfo.companyConflictEmailServerType, 'companyConflictEmailServerType not equal')
  assert_equal(nil , outputinfo.companyConflictSoftwareVersion, 'companyConflictSoftwareVersion not equal')
  assert_equal(nil , outputinfo.companyConflictSecuritySoftware, 'companyConflictSecuritySoftware not equal')
  
  end
end
