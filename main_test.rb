# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'main'
require 'output_info'

class MainTest < Test::Unit::TestCase

  def test_parser
  
  main =Mian.new
  outputinfo = main.parser('mail.txt')
  
  assert('www.163.com' , outputinfo.companyURL)
  assert('lovesesame' , outputinfo.correctEmail)
  assert('' , outputinfo.emailServer)
  assert('' , outputinfo.softwreVersion)
  assert('' , outputinfo.securitySoftware)
  assert('FALSE' , outputinfo.firstlastname)
  assert('lovesesame' , outputinfo.flastname)
  assert('FALSE' , outputinfo.nameConflics)
  assert('FALSE' , outputinfo.micrsoftExchange)
  assert('FALSE' , outputinfo.micrsoftExchangeV4)
  assert('FALSE' , outputinfo.micrsoftExchangeV5)
  assert('FALSE' , outputinfo.micrsoftExchangeV55)
  assert('FALSE' , outputinfo.micrsoftExchangeV6)
  assert('FALSE' , outputinfo.micrsoftExchangeV65)
  assert('FALSE' , outputinfo.micrsoftExchangeV8)
  assert('FALSE' , outputinfo.lotusNotesDominio)
  assert('NULL' , outputinfo.lotusNotesDominioVersion)
  assert('FALSE' , outputinfo.novellGrouwpise)
  assert('NULL' , outputinfo.novellGrouwpiseVersion)
  assert('FALSE' , outputinfo.googleApps)
  assert('FALSE' , outputinfo.other)
  assert('FALSE' , outputinfo.softwareTypeConflict)
  assert('FALSE' , outputinfo.softwareVersionConflict)
  assert('' , outputinfo.companyConflictEmailFormat)
  assert('' , outputinfo.companyConflictEmailServerType)
  assert('' , outputinfo.companyConflictSoftwareVersion)
  assert('' , outputinfo.companyConflictSecuritySoftware)
  
  end
end
