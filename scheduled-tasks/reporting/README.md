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

| Name                              | Type   |
|-----------------------------------|--------|
| aikaleima                         |        |
| päätos_tuesta                     |        |
| päätos_tuesta                     |        |
| lapsen_id                         |        |
| tuen_alkupvm                      |        |
| tuen_loppupvm                     |        |
| pienennetty_ryhmä                 |        |
| erityisryhmä                      |        |
| pienryhmä                         |        |
| ryhmäkohtainen_avustaja           |        |
| lapsikohtainen_avustaja           |        |
| henkilöresurssien_lisäys          |        |
| veon_antama_konsultaatio          |        |
| veon_osa_aikainen_opetus          |        |
| veon_kokoaikainen_opetus          |        |
| tulkitsemis_ja_avustamispalvelut  |        |
| apuvälineet                       |        |
| tuen_taso                         |        |
             

### Child aggregate
This child aggregate report aims to gather all child information that are present by id in the other DW reports. At the moment it aggregates the child id:s based on daily info and all the decision reports.

SQL script: [DW-Child_aggregate.sql](./sql/DW-Child_aggregate.sql) 
          
Fields in csv -report:

| Name                | Type   |
|---------------------|--------|
| pvm                 |        |
| lapsen_id           |        |
| henkilöturvatunnus  |        |
| syntymäaika         |        |
| kieli               |        |
| postiosoite         |        |
| postinumero         |        |
| postitoimipaikka    |        |
| kansalaisuudet      |        |


### Daily info
Daily info contains -report contains all placement related data per child from the last three years.

SQL script: [DW-Daily_info.sql](./sql/DW-Daily_info.sql)

Fields in csv -report:

| Name                           | Type   |
|--------------------------------|--------|
| pvm                            |        |
| lapsen_id                      |        |
| henkilöturvatunnus             |        |
| syntymäaika                    |        |
| kieli                          |        |
| postiosoite                    |        |
| postinumero                    |        |
| postitoimipaikka               |        |
| kansalaisuudet                 |        |
| sijoitustyyppi                 |        |
| sijoitusyksikkö_id             |        |
| sijoituksen_aloitus_pvm        |        |
| sijoituksen_loppu_pvm          |        |
| yksikön_nimi                   |        |
| palvelualue_id                 |        |
| palvelualue                    |        |
| toimintamuoto                  |        |
| järjestämistapa                |        |
| kustannuspaikka                |        |
| sijoitusryhmä_aloitus_pvm      |        |
| sijoitysryhmä_loppu_pvm        |        |
| sijoitusryhmä_id               |        |
| sijoitusryhmä                  |        |
| varahoitoyksikkö_id            |        |
| varahoitoyksikkö_aloitus_pvm   |        |
| varahoitoyksikkö_loppu_pvm     |        |
| varahoitoyksikkö               |        |
| varahoitoryhmä_id              |        |
| varahoitoryhmä                 |        |
| palveluntarve_merkitty         |        |
| palveluntarve                  |        |
| palveluntarve_id               |        |
| osapäiväinen                   |        |
| osaviikkoinen                  |        |
| palveluntarpeen_aloitus_pvm    |        |
| palveluntarpeen_loppu_pvm      |        |
| vuorohoito                     |        |
| tunteja_viikossa               |        |
| tuentarve_varhaiskasvatuksessa |        |
| tuentarve_varha_aloitus_pvm    |        |
| tuentarve_varha_loppu_pvm      |        |
| tuentarve_esiopetuksessa       |        |
| tuentarve_esiop_aloitus_pvm    |        |
| tuentarve_esiop_loppu_pvm      |        |
| tuentarpeen_kerroin            |        |
| kerroin_aloitus_pvm            |        |
| kerroin_loppu_pvm              |        |
| lapsen_kapasiteetti            |        |
| kapasiteetti_aloitus_pvm       |        |
| kapasiteetti_loppu_pvm         |        |
| poissaolon_syy                 |        |


### Daily units and groups attendance
Daily units and groups attendance -report contains daily aggregated staff and child attendance counts per daycare group.

SQL script: [DW-Daily_units_and_groups_attendance.sql](./sql/DW-Daily_units_and_groups_attendance.sql)

Fields in csv -report:

| Name                                       | Type   |
|--------------------------------------------|--------|
| aikaleima                                  |        |
| poiminta_ajalta_pvm                        |        |
| toimintayksikkö                            |        |
| toimintayksikkö_id                         |        |
| toimintayksikön_lapsimäärä                 |        |
| toimintayksikön_lapsimäärä_ed_kuun_lopussa |        |
| ryhmä                                      |        |
| ryhmä_id                                   |        |
| henkilökuntaa_ryhmässä                     |        |
| henkilökuntaa_läsnä                        |        |
| lapsia_läsnä_ryhmässä                      |        |
| laskennallinen_lapsia_läsnä_ryhmässä       |        |
| lapsia_läsnä_yksikössä                     |        |
| ryhmän_lapsimäärä                          |        |
| laskennallinen_ryhmän_lapsimäärä           |        |
| ryhmän_lapsimäärä_ed_kuun_lopussa          |        |


### Fee decicions
Fee decisions -report contains all sent (status = SENT) fee decisions from the last three years.

SQL script: [DW-Fee_decisions.sql](./sql/DW-Fee_decisions.sql)

Fields in csv -report:

| Name                  | Type   |
|-----------------------|--------|
| aikaleima             |        |
| maksupäätöksen_numero |        |
| maksupäätös_id        |        |
| alkupvm               |        |
| loppupvm              |        |
| huojennustyyppi       |        |
| perhekoko             |        |
| kokonaismaksu         |        |
| lapsi_id              |        |
| lapsikohtainen_maksu  |        |
| toimintamuoto         |        |
| palvelualue           |        |
| palvelualue_id        |        |
| toimipaikka           |        |
| toimipaikka_id        |        |
| kustannuspaikka       |        |
        

### Units and groups
Units and groups -report gathers general daycare unit and group information from the units that has been open the last three years.

SQL script: [DW-Units_and_groups.sql](./sql/DW-Units_and_groups.sql)

Fields in csv -report:

| Name                        | Type   |
|-----------------------------|--------|
| aikaleima                   |        |
| toimintayksikkö             |        |
| toimintayksikkö_id          |        |
| toimintayksikön_alkupvm     |        |
| toimintayksikön_loppupvm    |        |
| toimintamuoto               |        |
| järjestämistapa             |        |
| palvelualue                 |        |
| palvelualue_id              |        |
| dw_kustannuspaikka          |        |
| toimintayksikön_lapsimäärä  |        |
| ryhmä                       |        |
| ryhmä_id                    |        |
| ryhmän_alkupvm              |        |
| ryhmän_loppupvm             |        |
| henkilökuntaa_ryhmässä_viim |        |
| ryhmän_lapsimäärä           |        |


### Voucher value decisions
Voucher value decisions -report contains all sent (status = SENT) voucher value decisions from the last three years.

SQL script: [DW-Voucher_value_decisions](./sql/DW-Voucher_value_decisions)

Fields in csv -report:

| Name                 | Type   |
|----------------------|--------|
| aikaleima            |        |
| arvopäätöksen_numero |        |
| alkupvm              |        |
| loppupvm             |        |
| huojennustyyppi      |        |
| perhekoko            |        |
| palvelusetelin_arvo  |        |
| omavastuuosuus       |        |
| lapsen_id            |        |
| toimintamuoto        |        |
| palvelualue          |        |
| palvelualue_id       |        |
| toimipaikka          |        |
| toimipaikka_id       |        | 