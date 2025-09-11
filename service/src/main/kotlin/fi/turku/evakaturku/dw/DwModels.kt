package fi.turku.evakaturku.dw

import fi.espoo.evaka.absence.AbsenceCategory
import fi.espoo.evaka.absence.AbsenceType
import fi.espoo.evaka.application.ApplicationOrigin
import fi.espoo.evaka.application.ApplicationStatus
import fi.espoo.evaka.application.ApplicationType
import fi.espoo.evaka.assistance.DaycareAssistanceLevel
import fi.espoo.evaka.assistance.PreschoolAssistanceLevel
import fi.espoo.evaka.assistanceaction.AssistanceActionOption
import fi.espoo.evaka.assistanceaction.AssistanceActionOptionCategory
import fi.espoo.evaka.daycare.CareType
import fi.espoo.evaka.daycare.domain.ProviderType
import fi.espoo.evaka.invoicing.domain.FeeDecisionType
import fi.espoo.evaka.invoicing.domain.VoucherValueDecisionType
import fi.espoo.evaka.placement.PlacementType
import fi.espoo.evaka.serviceneed.ShiftCareType
import java.time.LocalDate
import java.util.UUID

data class DwAbsence(
    val lapsenid: UUID,
    val poissaolonpvm: LocalDate,
    val poissaolontyyppi: AbsenceType,
    val poissaolonkategoria: AbsenceCategory,
    val sijoitustyyppi: PlacementType,
)

data class DwApplicationInfos(
    val tiedostonAjopaiva: String,
    val hakemuksenId: UUID,
    val hakemusLuotu: String,
    val hakemustaPaivitetty: String,
    val tyyppi: ApplicationType,
    val tilanne: ApplicationStatus,
    val alkupera: ApplicationOrigin,
    val siirtohakemus: Boolean,
    val lapsenId: UUID,
    val syntymaaika: LocalDate,
    val yksikot: String,
    val haluttuAloituspaiva: String,
    val yksikkoNimi: String,
    val alueId: UUID,
    val alueNimi: String,
)

data class DwAssistanceActions(
    val pvm: String,
    val lapsenId: UUID,
    val tukitoimi: String,
    val muuTukitoimi: String,
    val aloitusPvm: LocalDate,
    val loppuPvm: LocalDate,
    val tuenTyyppi: AssistanceActionOptionCategory,
)

data class DwAssistanceNeedDecision(
    val aikaleima: String,
    val päätosTuesta: Int,
    val lapsenId: UUID,
    val tuenAlkupvm: LocalDate,
    val tuenLoppupvm: LocalDate,
    val pienennettyRyhmä: Boolean,
    val erityisryhmä: Boolean,
    val pienryhmä: Boolean,
    val ryhmäkohtainenAvustaja: Boolean,
    val lapsikohtainenAvustaja: Boolean,
    val henkilöresurssienLisäys: Boolean,
    val veonAntamaKonsultaatio: Boolean,
    val veonOsaAikainenOpetus: Boolean,
    val veonKokoaikainenOpetus: Boolean,
    val tulkitsemisJaAvustamispalvelut: Boolean,
    val apuvälineet: Boolean,
    val tuenTaso: List<String>,
)

data class DwChildAggregate(
    val pvm: String,
    val lapsenId: UUID,
    val henkilöturvatunnus: String?,
    val syntymäaika: LocalDate,
    val kieli: String?,
    val postiosoite: String,
    val postinumero: String,
    val postitoimipaikka: String,
    val kansalaisuudet: List<String>,
)

data class DwDailyInfo(
    val pvm: String,
    val lapsenId: UUID,
    val henkilöturvatunnus: String?,
    val syntymäaika: LocalDate,
    val kieli: String?,
    val postiosoite: String,
    val postinumero: String,
    val postitoimipaikka: String,
    val kansalaisuudet: List<String>?,
    val sijoitustyyppi: PlacementType,
    val sijoitusyksikköId: UUID,
    val sijoituksenAloitusPvm: LocalDate,
    val sijoituksenLoppuPvm: LocalDate?,
    val yksikönNimi: String,
    val palvelualueId: UUID,
    val palvelualue: String,
    val toimintamuoto: List<CareType>,
    val järjestämistapa: ProviderType,
    val kustannuspaikka: String?,
    val sijoitusryhmäAloitusPvm: LocalDate,
    val sijoitysryhmäLoppuPvm: LocalDate?,
    val sijoitusryhmäId: UUID,
    val sijoitusryhmä: String,
    val varahoitoyksikköId: UUID?,
    val varahoitoyksikköAloitusPvm: LocalDate?,
    val varahoitoyksikköLoppuPvm: LocalDate?,
    val varahoitoyksikkö: String?,
    val varahoitoryhmäId: UUID?,
    val varahoitoryhmä: String?,
    val palveluntarveMerkitty: Boolean?,
    val palveluntarve: String?,
    val palveluntarveId: UUID?,
    val osapäiväinen: Boolean?,
    val osaviikkoinen: Boolean?,
    val palveluntarpeenAloitusPvm: LocalDate?,
    val palveluntarpeenLoppuPvm: LocalDate?,
    val vuorohoito: ShiftCareType?,
    val tuntejaViikossa: Int?,
    val palveluntarvekerroin: Double?,
    val tuentarveVarhaiskasvatuksessa: DaycareAssistanceLevel?,
    val tuentarveVarhaAloitusPvm: LocalDate?,
    val tuentarveVarhaLoppuPvm: LocalDate?,
    val tuentarveEsiopetuksessa: PreschoolAssistanceLevel?,
    val tuentarveEsiopAloitusPvm: LocalDate?,
    val tuentarveEsiopLoppuPvm: LocalDate?,
    val tuentarpeenKerroin: Double?,
    val kerroinAloitusPvm: String?,
    val kerroinLoppuPvm: LocalDate?,
    val lapsenKapasiteetti: Double?,
    val kapasiteettiAloitusPvm: LocalDate?,
    val kapasiteettiLoppuPvm: LocalDate?,
    val poissaolonSyy: String?,
)

data class DwDailyUnitAndGroupAttendance(
    val aikaleima: String,
    val poimintaAjaltaPvm: LocalDate?,
    val toimintayksikkö: String,
    val toimintayksikköId: UUID,
    val toimintayksikönLapsimäärä: Int?,
    val toimintayksikönLapsimääräEdKuunLopussa: Int?,
    val ryhmä: String,
    val ryhmäId: UUID,
    val henkilökuntaaRyhmässä: Int?,
    val henkilökuntaaLäsnä: Int?,
    val lapsiaLäsnäRyhmässä: Int?,
    val laskennallinenLapsiaLäsnäRyhmässä: Int?,
    val lapsiaLäsnäYksikössä: Int?,
    val ryhmänLapsimäärä: Int?,
    val laskennallinenRyhmänLapsimäärä: Int?,
    val ryhmänLapsimääräEdKuunLopussa: Int?,
)

data class DwDailyUnitOccupancyConfirmed(
    val pvm: LocalDate,
    val toimintayksikköId: UUID,
    val toimintayksikkö: String,
    val kasvattajienLkm: Int?,
    val sijoituksienLkm: Int?,
    val täyttöasteSumma: Double?,
    val täyttöasteProsentteina: Double?,
)

data class DwDailyUnitOccupancyRealized(
    val pvm: LocalDate,
    val toimintayksikköId: UUID,
    val toimintayksikkö: String,
    val kasvattajienLkm: Int?,
    val sijoituksienLkm: Int?,
    val käyttöasteSumma: Int?,
    val käyttöasteProsentteina: Double?,
)

data class DwFeeDecision(
    val aikaleima: String,
    val maksupäätöksenNumero: String?,
    val maksupäätösId: UUID,
    val alkupvm: LocalDate,
    val loppupvm: LocalDate,
    val huojennustyyppi: FeeDecisionType,
    val perhekoko: Int,
    val kokonaismaksu: Int,
    val lapsiId: UUID,
    val lapsikohtainenMaksu: Int,
    val toimintamuoto: PlacementType,
    val palvelualue: String,
    val palvelualueId: UUID,
    val toimipaikka: String,
    val toimipaikkaId: UUID,
    val kustannuspaikka: String?,
)

data class DwUnitAndGroup(
    val aikaleima: String,
    val toimintayksikkö: String,
    val toimintayksikköId: UUID,
    val toimintayksikönAlkupvm: LocalDate?,
    val toimintayksikönLoppupvm: LocalDate?,
    val toimintamuoto: List<CareType>,
    val järjestämistapa: ProviderType,
    val palvelualue: String,
    val palvelualueId: UUID,
    val dwKustannuspaikka: String?,
    val toimintayksikönLapsimäärä: Int,
    val ryhmä: String,
    val ryhmäId: UUID,
    val ryhmänAlkupvm: LocalDate,
    val ryhmänLoppupvm: LocalDate?,
    val ryhmanHenkilokunnanAlkupvm: LocalDate?,
    val ryhmanHenkilokunnanLoppupvm: LocalDate?,
    val henkilökuntaaRyhmässäViim: Int?,
)

data class DwVoucherValueDecision(
    val aikaleima: String,
    val arvopäätöksenNumero: String?,
    val alkupvm: LocalDate,
    val loppupvm: LocalDate?,
    val huojennustyyppi: VoucherValueDecisionType,
    val perhekoko: Int,
    val palvelusetelinArvo: Int,
    val omavastuuosuus: Int,
    val lapsenId: UUID,
    val toimintamuoto: PlacementType?,
    val palvelualue: String,
    val palvelualueId: UUID,
    val toimipaikka: String,
    val toimipaikkaId: UUID,
)
