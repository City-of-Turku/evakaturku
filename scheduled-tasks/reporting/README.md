<!--
SPDX-FileCopyrightText: 2024 City of Turku

SPDX-License-Identifier: LGPL-2.1-or-later
-->

# Data Warehouse Integration (DW)
eVaka data is sent to dedicated data warehouse daily through a scheduled task. DW reports (csv -format) are exported to the citys SFTP and from there DW fetches the exported csv -reports. The scheduled task runs [db_to_csv.sh bash script](./db_to_csv.sh), which does all the data querying and exporting to SFTP. All exported reports are also backed up to eVaka environments S3 storage just in case.

All reports are made via SQL scripts/queries found under [/sql folder](./sql). Every report is customized and made based on a concrete need. Below is briefly described the contents of each DW report:
   

### Assistance need decisions
Assistance need decisions -report contains all decisions from the last three years.

SQL script: [DW-Assistance_need_decisions.sql](./sql/DW-Assistance_need_decisions.sql)

Fields in csv -report:

| Name                              | Type                                                         |
|-----------------------------------|--------------------------------------------------------------|
| aikaleima                         | timestamp                                                    |
| päätos_tuesta                     | Number                                                       |
| lapsen_id                         | UUID                                                         |
| tuen_alkupvm                      | Date                                                         |
| tuen_loppupvm                     | Date                                                         |
| pienennetty_ryhmä                 | Boolean                                                      |
| erityisryhmä                      | Boolean                                                      |
| pienryhmä                         | Boolean                                                      |
| ryhmäkohtainen_avustaja           | Boolean                                                      |
| lapsikohtainen_avustaja           | Boolean                                                      |
| henkilöresurssien_lisäys          | Boolean                                                      |
| veon_antama_konsultaatio          | Boolean                                                      |
| veon_osa_aikainen_opetus          | Boolean                                                      |
| veon_kokoaikainen_opetus          | Boolean                                                      |
| tulkitsemis_ja_avustamispalvelut  | Boolean                                                      |
| apuvälineet                       | Boolean                                                      |
| tuen_taso                         | Enum: fi.espoo.evaka.assistanceneed.decision.AssistanceLevel |
             

### Child aggregate
This child aggregate report aims to gather all child information that are present by id in the other DW reports. At the moment it aggregates the child id:s based on daily info and all the decision reports.

SQL script: [DW-Child_aggregate.sql](./sql/DW-Child_aggregate.sql) 
          
Fields in csv -report:

| Name                | Type      |
|---------------------|-----------|
| pvm                 | timestamp |
| lapsen_id           | UUID      |
| henkilöturvatunnus  | String    |
| syntymäaika         | Date      |
| kieli               | String    |
| postiosoite         | String    |
| postinumero         | String    |
| postitoimipaikka    | String    |
| kansalaisuudet      | String[]  |


### Daily info
Daily info contains -report contains all placement related data per child from the last three years.

 

SQL script: [DW-Daily_info.sql](./sql/DW-Daily_info.sql)

Fields in csv -report:

| Name                           | Type                                                       |
|--------------------------------|------------------------------------------------------------|
| pvm                            | timestamp                                                  |
| lapsen_id                      | UUID                                                       |
| henkilöturvatunnus             | String                                                     |
| syntymäaika                    | Date                                                       |
| kieli                          | String                                                     |
| postiosoite                    | String                                                     |
| postinumero                    | String                                                     |
| postitoimipaikka               | String                                                     |
| kansalaisuudet                 | String[]                                                   |
| sijoitustyyppi                 | Enum: fi.espoo.evaka.placement.PlacementType               |
| sijoitusyksikkö_id             | UUID                                                       |
| sijoituksen_aloitus_pvm        | Date                                                       |
| sijoituksen_loppu_pvm          | Date                                                       |
| yksikön_nimi                   | String                                                     |
| palvelualue_id                 | UUID                                                       |
| palvelualue                    | String                                                     |
| toimintamuoto                  | Enum: fi.espoo.evaka.daycare.CareType                      |
| järjestämistapa                | Enum: fi.espoo.evaka.daycare.domain.ProviderType           |
| kustannuspaikka                | String                                                     |
| sijoitusryhmä_aloitus_pvm      | Date                                                       |
| sijoitysryhmä_loppu_pvm        | Date                                                       |
| sijoitusryhmä_id               | UUID                                                       |
| sijoitusryhmä                  | String                                                     |
| varahoitoyksikkö_id            | UUID                                                       |
| varahoitoyksikkö_aloitus_pvm   | Date                                                       |
| varahoitoyksikkö_loppu_pvm     | Date                                                       |
| varahoitoyksikkö               | String                                                     |
| varahoitoryhmä_id              | UUID                                                       |
| varahoitoryhmä                 | String                                                     |
| palveluntarve_merkitty         | Boolean                                                    |
| palveluntarve                  | String                                                     |
| palveluntarve_id               | UUID                                                       |
| osapäiväinen                   | Boolean                                                    |
| osaviikkoinen                  | Boolean                                                    |
| palveluntarpeen_aloitus_pvm    | Date                                                       |
| palveluntarpeen_loppu_pvm      | Date                                                       |
| vuorohoito                     | Enum: fi.espoo.evaka.serviceneed.ShiftCareType             |
| tunteja_viikossa               | Number                                                     |
| tuentarve_varhaiskasvatuksessa | Enum: fi.espoo.evaka.assistance.DaycareAssistanceLevel     |
| tuentarve_varha_aloitus_pvm    | Date                                                       |
| tuentarve_varha_loppu_pvm      | Date                                                       |
| tuentarve_esiopetuksessa       | Enum: fi.espoo.evaka.assistance.OtherAssistanceMeasureType |
| tuentarve_esiop_aloitus_pvm    | Date                                                       |
| tuentarve_esiop_loppu_pvm      | Date                                                       |
| tuentarpeen_kerroin            | Number                                                     |
| kerroin_aloitus_pvm            | Date                                                       |
| kerroin_loppu_pvm              | Date                                                       |
| lapsen_kapasiteetti            | Number                                                     |
| kapasiteetti_aloitus_pvm       | Date                                                       |
| kapasiteetti_loppu_pvm         | Date                                                       |
| poissaolon_syy                 | Enum: fi.espoo.evaka.absence.AbsenceType                   |


NOTE refactor proposal: Should this be normalized regarding daycare and preschool assistance fields(?):
* tuentarve_varhaiskasvatuksessa
* tuentarve_varha_aloitus_pvm
* tuentarve_varha_loppu_pvm    
* tuentarve_esiopetuksessa    
* tuentarve_esiop_aloitus_pvm
* tuentarve_esiop_loppu_pvm

The above listed daycare and preschool assistance fields could be normalized into dedicated DW reports like in [eVaka Oulu](https://github.com/Oulunkaupunki/evakaoulu/blob/main/scheduled-tasks/reporting/sql):
* This change should be proposed to DW representatives, if they would benefit from this change
* [Preschool assistance report](https://github.com/Oulunkaupunki/evakaoulu/blob/main/scheduled-tasks/reporting/sql/DW-Preschool_assistances.sql)
* [Daycare assistance report](https://github.com/Oulunkaupunki/evakaoulu/blob/main/scheduled-tasks/reporting/sql/DW-Daycare_assistances.sql)


### Daily units and groups attendance
Daily units and groups attendance -report contains daily aggregated staff and child attendance counts per daycare group.

SQL script: [DW-Daily_units_and_groups_attendance.sql](./sql/DW-Daily_units_and_groups_attendance.sql)

Fields in csv -report:

| Name                                       | Type      |
|--------------------------------------------|-----------|
| aikaleima                                  | timestamp |
| poiminta_ajalta_pvm                        | Date      |
| toimintayksikkö                            | String    |
| toimintayksikkö_id                         | UUID      |
| toimintayksikön_lapsimäärä                 | Number    |
| toimintayksikön_lapsimäärä_ed_kuun_lopussa | Number    |
| ryhmä                                      | String    |
| ryhmä_id                                   | UUID      |
| henkilökuntaa_ryhmässä                     | Number    |
| henkilökuntaa_läsnä                        | Number    |
| lapsia_läsnä_ryhmässä                      | Number    |
| laskennallinen_lapsia_läsnä_ryhmässä       | Number    |
| lapsia_läsnä_yksikössä                     | Number    |
| ryhmän_lapsimäärä                          | Number    |
| laskennallinen_ryhmän_lapsimäärä           | Number    |
| ryhmän_lapsimäärä_ed_kuun_lopussa          | Number    |


### Fee decicions
Fee decisions -report contains all sent (status = SENT) fee decisions from the last three years.

SQL script: [DW-Fee_decisions.sql](./sql/DW-Fee_decisions.sql)

Fields in csv -report:

| Name                  | Type                                         |
|-----------------------|----------------------------------------------|
| aikaleima             | timestamp                                    |
| maksupäätöksen_numero | Number                                       |
| maksupäätös_id        | UUID                                         |
| alkupvm               | Date                                         |
| loppupvm              | Date                                         |
| huojennustyyppi       | Enum: fi.espoo.evaka.decision.DecisionType   |
| perhekoko             | Number                                       |
| kokonaismaksu         | Number                                       |
| lapsi_id              | UUID                                         |
| lapsikohtainen_maksu  | Number                                       |
| toimintamuoto         | Enum: fi.espoo.evaka.placement.PlacementType |
| palvelualue           | String                                       |
| palvelualue_id        | UUID                                         |
| toimipaikka           | String                                       |
| toimipaikka_id        | UUID                                         |
| kustannuspaikka       | String                                       |
        

### Units and groups
Units and groups -report gathers general daycare unit and group information from the units that has been open the last three years.

SQL script: [DW-Units_and_groups.sql](./sql/DW-Units_and_groups.sql)

Fields in csv -report:

| Name                        | Type                                             |
|-----------------------------|--------------------------------------------------|
| aikaleima                   | timestamp                                        |
| toimintayksikkö             | String                                           |
| toimintayksikkö_id          | UUID                                             |
| toimintayksikön_alkupvm     | Date                                             |
| toimintayksikön_loppupvm    | Date                                             |
| toimintamuoto               | Enum: fi.espoo.evaka.daycare.CareType            |
| järjestämistapa             | Enum: fi.espoo.evaka.daycare.domain.ProviderType |
| palvelualue                 | String                                           |
| palvelualue_id              | UUID                                             |
| dw_kustannuspaikka          | String                                           |
| toimintayksikön_lapsimäärä  | Number                                           |
| ryhmä                       | String                                           |
| ryhmä_id                    | UUID                                             |
| ryhmän_alkupvm              | Date                                             |
| ryhmän_loppupvm             | Date                                             |
| henkilökuntaa_ryhmässä_viim | Number                                           |
| ryhmän_lapsimäärä           | Number                                           |


### Voucher value decisions
Voucher value decisions -report contains all sent (status = SENT) voucher value decisions from the last three years.

SQL script: [DW-Voucher_value_decisions](./sql/DW-Voucher_value_decisions)

Fields in csv -report:

| Name                 | Type                                                           |
|----------------------|----------------------------------------------------------------|
| aikaleima            | timestamp                                                      |
| arvopäätöksen_numero | Nubmer                                                         |
| alkupvm              | Date                                                           |
| loppupvm             | Date                                                           |
| huojennustyyppi      | Enum: fi.espoo.evaka.invoicing.domain.VoucherValueDecisionType |
| perhekoko            | Number                                                         |
| palvelusetelin_arvo  | Number                                                         |
| omavastuuosuus       | Number                                                         |
| lapsen_id            | UUID                                                           |
| toimintamuoto        | Enum: fi.espoo.evaka.placement.PlacementType                   |
| palvelualue          | String                                                         |
| palvelualue_id       | UUID                                                           |
| toimipaikka          | String                                                         |
| toimipaikka_id       | UUID                                                           | 