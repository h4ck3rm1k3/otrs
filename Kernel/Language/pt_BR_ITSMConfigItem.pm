# --
# Kernel/Language/pt_BR_ITSMConfigItem.pm - the Brazilian translation of ITSMConfigItem
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# Copyright (C) 2010 Cristiano Kornd�rfer, http://www.dorfer.com.br/
# --
# $Id: pt_BR_ITSMConfigItem.pm,v 1.3 2010/09/21 17:09:44 cr Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::pt_BR_ITSMConfigItem;

use strict;
use warnings;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.3 $) [1];

sub Data {
    my $Self = shift;

    my $Lang = $Self->{Translation};

    return if ref $Lang ne 'HASH';

    $Lang->{'Config Item'}            = 'Item de Configura��o';
    $Lang->{'Config Item-Area'}       = 'Itens de Configura��o';
    $Lang->{'Config Item Management'} = 'Gerenciamento de Itens de Configura��o';
    $Lang->{'Change Definition'}      = 'Mudar Defini��o';
    $Lang->{'Class'}                  = 'Classe';
    $Lang->{'Show Versions'}          = 'Visualizar Vers�es';
    $Lang->{'Hide Versions'}          = 'Ocultar Vers�es';
    $Lang->{'Last changed by'}        = '�ltima modifica��o por';
    $Lang->{'Last changed'}           = '�ltima modifica��o';
    $Lang->{'Change of definition failed! See System Log for details.'}
        = 'Mudan�a da defini��o falhou! Consulte o Log do Sistema para detalhes.';
    $Lang->{'Also search in previous versions?'} = 'Procurar nas ver�es anteriores tamb�m?';
    $Lang->{'Config Items shown'}                = 'Itens de Configura��o visualizados';
    $Lang->{'Config Items available'}            = 'Itens de Configura��o dispon�veis';
    $Lang->{'Search Config Items'}               = 'Pesquisar Itens de Configura��o';
    $Lang->{'Deployment State'}                  = 'Estado da Implanta��o';
    $Lang->{'Current Deployment State'}          = 'Estado da Implanta��o Atual';
    $Lang->{'Incident State'}                    = 'Estado do Incidente';
    $Lang->{'Current Incident State'}            = 'Estado do Incidente Atual';
    $Lang->{'The name of this config item'}      = 'O nome deste item de configura��o';
    $Lang->{'The deployment state of this config item'}
        = 'O estado de implanta��o deste item de configura��o';
    $Lang->{'The incident state of this config item'} = 'O estado de incidente deste item de configura��o';
    $Lang->{'Last Change'}                            = '�ltima Altera��o';
    $Lang->{'Duplicate'}                              = 'Duplicar';
    $Lang->{'Expired'}                                = 'Expirado';
    $Lang->{'Inactive'}                               = 'Inativo';
    $Lang->{'Maintenance'}                            = 'Manuten��o';
    $Lang->{'Pilot'}                                  = 'Piloto';
    $Lang->{'Planned'}                                = 'Planejado';
    $Lang->{'Production'}                             = 'Produ��o';
    $Lang->{'Repair'}                                 = 'Reparo';
    $Lang->{'Retired'}                                = 'Retirado';
    $Lang->{'Review'}                                 = 'Revis�o';
    $Lang->{'Test/QA'}                                = 'Teste de Qualidade';
    $Lang->{'Operational'}                            = 'Operacional';
    $Lang->{'Incident'}                               = 'Incidente';
    $Lang->{'Desktop'}                                = '';
    $Lang->{'Laptop'}                                 = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'PDA'}                                    = '';
    $Lang->{'Phone'}                                  = 'Telefone';
    $Lang->{'Server'}                                 = 'Servidor';
    $Lang->{'Backup Device'}                          = 'Dispositivo de Backup';
    $Lang->{'Beamer'}                                 = '';
    $Lang->{'Camera'}                                 = '';
    $Lang->{'Docking Station'}                        = '';
    $Lang->{'Keybord'}                                = 'Teclado';
    $Lang->{'Modem'}                                  = '';
    $Lang->{'Monitor'}                                = '';
    $Lang->{'Mouse'}                                  = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'PCMCIA Card'}                            = 'Cart�o PCMCIA';
    $Lang->{'Printer'}                                = 'Impressora';
    $Lang->{'Router'}                                 = 'Roteador';
    $Lang->{'Scanner'}                                = '';
    $Lang->{'Security Device'}                        = 'Dispositivo de Seguran�a';
    $Lang->{'Switch'}                                 = '';
    $Lang->{'USB Device'}                             = 'Dispositivo USB';
    $Lang->{'WLAN Access Point'}                      = '';
    $Lang->{'GSM'}                                    = '';
    $Lang->{'LAN'}                                    = 'REDE';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'Telco'}                                  = '';
    $Lang->{'WLAN'}                                   = '';
    $Lang->{'Admin Tool'}                             = 'Ferramenta de Administra��o';
    $Lang->{'Client Application'}                     = 'Aplica��o Cliente';
    $Lang->{'Client OS'}                              = 'SO Cliente';
    $Lang->{'Embedded'}                               = '';
    $Lang->{'Middleware'}                             = '';
    $Lang->{'Other'}                                  = 'Outro';
    $Lang->{'Server Application'}                     = 'Aplica��o Servidor';
    $Lang->{'Server OS'}                              = 'SO Servidor';
    $Lang->{'User Tool'}                              = 'Ferramenta do Usu�rio';
    $Lang->{'Concurrent Users'}                       = 'Usu�rios Concorrentes';
    $Lang->{'Demo'}                                   = '';
    $Lang->{'Developer Licence'}                      = 'Licen�a de Desenvolvedor';
    $Lang->{'Enterprise Licence'}                     = 'Licen�a Corporativa';
    $Lang->{'Freeware'}                               = '';
    $Lang->{'Open Source'}                            = '';
    $Lang->{'Per Node'}                               = 'Por N�';
    $Lang->{'Per Processor'}                          = 'Por Processador';
    $Lang->{'Per Server'}                             = 'Por Servidor';
    $Lang->{'Per User'}                               = 'Por Usu�rio';
    $Lang->{'Single Licence'}                         = 'Licen�a �nica';
    $Lang->{'Time Restricted'}                        = 'Tempo Restrito';
    $Lang->{'Unlimited'}                              = 'Ilimitada';
    $Lang->{'Volume Licence'}                         = 'Licen�a por Volume';
    $Lang->{'Model'}                                  = 'Modelo';
    $Lang->{'Serial Number'}                          = 'N�mero de S�rie';
    $Lang->{'Operating System'}                       = 'Sistema Operacional';
    $Lang->{'CPU'}                                    = 'Processador';
    $Lang->{'Ram'}                                    = 'Mem�ria RAM';
    $Lang->{'Hard Disk'}                              = 'Disco R�gido';
    $Lang->{'Hard Disk::Capacity'}                    = 'Disco R�gido::Capacidade';
    $Lang->{'Capacity'}                               = 'Capacidade';
    $Lang->{'FQDN'}                                   = '';
    $Lang->{'Network Adapter'}                        = 'Adaptador de Rede';
    $Lang->{'Network Adapter::IP over DHCP'}          = 'Adaptador de Rede::DHCP';
    $Lang->{'Network Adapter::IP Address'}            = 'Adaptador de Rede::Endere�o IP';
    $Lang->{'IP over DHCP'}                           = 'DHCP';
    $Lang->{'IP Address'}                             = 'Endere�o IP';
    $Lang->{'Graphic Adapter'}                        = 'Adaptador Gr�fico';
    $Lang->{'Other Equipment'}                        = 'Outro Equipamento';
    $Lang->{'Warranty Expiration Date'}               = 'Data de Expira��o da Garantia';
    $Lang->{'Install Date'}                           = 'Data Instala��o';
    $Lang->{'Network Address'}                        = 'Endere�o de Rede';
    $Lang->{'Network Address::Subnet Mask'}           = 'Endere�o de Rede::M�scara de Subrede';
    $Lang->{'Network Address::Gateway'}               = 'Endere�o de Rede::Roteador Padr�o';
    $Lang->{'Subnet Mask'}                            = 'M�scara de Subrede';
    $Lang->{'Gateway'}                                = 'Roteador Padr�o';
    $Lang->{'Licence Type'}                           = 'Tipo de Licen�a';
    $Lang->{'Licence Key'}                            = 'Chave de Licen�a';
    $Lang->{'Licence Key::Quantity'}                  = 'Chave de Licen�a::Quantidade';
    $Lang->{'Licence Key::Expiration Date'}           = 'Chave de Licen�a::Data de Expira��o';
    $Lang->{'Quantity'}                               = 'Quantidade';
    $Lang->{'Expiration Date'}                        = 'Data de Expira��o';
    $Lang->{'Media'}                                  = 'M�dia';
    $Lang->{'Maximum number of one element'}          = 'N�mero m�ximo de um elemento';
    $Lang->{'Identifier'}                             = 'Identificador';
    $Lang->{'Phone 1'}                                = 'Telefone 1';
    $Lang->{'Phone 2'}                                = 'Telefone 2';
    $Lang->{'Address'}                                = 'Endere�o';
    $Lang->{'Building'}                               = 'Pr�dio';
    $Lang->{'Floor'}                                  = 'Andar';
    $Lang->{'IT Facility'}                            = 'Departamento de TI';
    $Lang->{'Office'}                                 = 'Escrit�rio';
    $Lang->{'Outlet'}                                 = 'Tomada';
    $Lang->{'Rack'}                                   = '';
    $Lang->{'Room'}                                   = 'Sala';
    $Lang->{'Workplace'}                              = 'Local de Trabalho';
    $Lang->{'CIHistory::ConfigItemCreate'}              = '';
    $Lang->{'CIHistory::VersionCreate'}                 = '';
    $Lang->{'CIHistory::DeploymentStateUpdate'}         = '';
    $Lang->{'CIHistory::IncidentStateUpdate'}           = '';
    $Lang->{'CIHistory::ConfigItemDelete'}              = '';
    $Lang->{'CIHistory::LinkAdd'}                       = '';
    $Lang->{'CIHistory::LinkDelete'}                    = '';
    $Lang->{'CIHistory::DefinitionUpdate'}              = '';
    $Lang->{'CIHistory::NameUpdate'}                    = '';
    $Lang->{'CIHistory::ValueUpdate'}                   = '';
    $Lang->{'CIHistory::VersionDelete'}                 = '';
    $Lang->{'Frontend module registration for the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to go back in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Presents a link in the menu to go show versions in the configuraton item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to access the history of a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to edit a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to print a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu that allows linking a configuration item with another object in the config item zoom view of the agent interface.'} = '';
    $Lang->{'Shows a link in the menu to duplicate a configuration item in the its zoom view of the agent interface.'} = '';
    $Lang->{'Selects the configuration item number generator module. "AutoIncrement" increments the configuration item number, the SystemID, the ConfigItemClassID and the counter are used. The format is "SystemID.ConfigItemClassID.Counter", e.g. 1205000004, 1205000005.'} = '';
    $Lang->{'Defines the default subobject of the class \'ITSMConfigItem\'.'} = '';
    $Lang->{'Module to genetare ITSM config item statistics.'} = '';
    $Lang->{'Object backend module registration for the import/export module.'} = '';
    $Lang->{'Config item event module that enables logging to history in the agent interface.'} = '';
    $Lang->{'Shows the config item history (reverse ordered) in the agent interface.'} = '';
    $Lang->{'Parameters for the deployment states in the preferences view of the agent interface.'} = '';
    $Lang->{'Module to check the group responsible for a class.'} = '';
    $Lang->{'Module to check the group responsible for a configuration item.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the edit ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the add ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the history ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the print ITSM configuration item screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item zoom screen in the agent interface.'} = '';
    $Lang->{'Required permissions to use the ITSM configuration item search screen in the agent interface.'} = '';
    $Lang->{'Configuration item search backend router of the agent interface.'} = '';
    $Lang->{'Parameters for the pages (in which the configuration items are shown).'} = '';
    $Lang->{'Configuration Item Limit'} = '';
    $Lang->{'Configuration Item limit per page'} = '';

    return 1;
}

1;
