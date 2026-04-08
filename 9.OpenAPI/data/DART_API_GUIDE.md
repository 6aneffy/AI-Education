고유번호 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/corpCode.xml	UTF-8	Zip FILE (binary)
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
corp_code	고유번호	공시대상회사의 고유번호(8자리) ※ ZIP File 안에 있는 XML파일 정보
corp_name	정식명칭	정식회사명칭 ※ ZIP File 안에 있는 XML파일 정보
corp_eng_name	영문 정식명칭	영문정식회사명칭
※ ZIP File 안에 있는 XML파일 정보
stock_code	종목코드	상장회사인 경우 주식의 종목코드(6자리) ※ ZIP File 안에 있는 XML파일 정보
modify_date	최종변경일자	기업개황정보 최종변경일자(YYYYMMDD) ※ ZIP File 안에 있는 XML파일 정보

---

공시검색 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/list.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/list.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	N	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bgn_de	시작일	STRING(8)	N	검색시작 접수일자(YYYYMMDD)
1) 기본값 : 종료일(end_de)
2) 고유번호(corp_code)가 없는 경우 검색기간은 3개월로 제한
end_de	종료일	STRING(8)	N	검색종료 접수일자(YYYYMMDD)
1) 기본값 : 당일
last_reprt_at	최종보고서 검색여부	STRING(1)	N	최종보고서만 검색여부(Y or N)
1) 기본값 : N(정정이 있는 경우 최종정정만 검색)
pblntf_ty	공시유형	STRING(1)	N	A : 정기공시
B : 주요사항보고
C : 발행공시
D : 지분공시
E : 기타공시
F : 외부감사관련
G : 펀드공시
H : 자산유동화
I : 거래소공시
J : 공정위공시
pblntf_detail_ty	공시상세유형	STRING(4)	N	(※ 상세 유형 참조 : pblntf_detail_ty)
corp_cls	법인구분	STRING(1)	N	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
※ 없으면 전체조회, 복수조건 불가
sort	정렬	STRING(4)	N	접수일자: date
회사명 : crp
보고서명 : rpt
※ 기본값 : date
sort_mth	정렬방법	STRING(4)	N	오름차순(asc), 내림차순(desc)
※ 기본값 : desc
page_no	페이지 번호	STRING(5)	N	페이지 번호(1~n) 기본값 : 1
page_count	페이지 별 건수	STRING(3)	N	페이지당 건수(1~100) 기본값 : 10, 최대값 : 100
상세 유형
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
page_no	페이지 번호	페이지 번호
page_count	페이지 별 건수	페이지 별 건수
total_count	총 건수	총 페이지 수
total_page	총 페이지 수	총 페이지 수
list		
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_name	종목명(법인명)	공시대상회사의 종목명(상장사) 또는 법인명(기타법인)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
stock_code	종목코드	상장회사의 종목코드(6자리)
report_nm	보고서명	공시구분+보고서명+기타정보
[기재정정] : 본 보고서명으로 이미 제출된 보고서의 기재내용이 변경되어 제출된 것임
[첨부정정] : 본 보고서명으로 이미 제출된 보고서의 첨부내용이 변경되어 제출된 것임
[첨부추가] : 본 보고서명으로 이미 제출된 보고서의 첨부서류가 추가되어 제출된 것임
[변경등록] : 본 보고서명으로 이미 제출된 보고서의 유동화계획이 변경되어 제출된 것임
[연장결정] : 본 보고서명으로 이미 제출된 보고서의 신탁계약이 연장되어 제출된 것임
[발행조건확정] : 본 보고서명으로 이미 제출된 보고서의 유가증권 발행조건이 확정되어 제출된 것임
[정정명령부과] : 본 보고서에 대하여 금융감독원이 정정명령을 부과한 것임
[정정제출요구] : 본 보고서에 대하여 금융감독원이 정정제출요구을 부과한 것임
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
flr_nm	공시 제출인명	공시 제출인명
rcept_dt	접수일자	공시 접수일자(YYYYMMDD)
rm	비고	조합된 문자로 각각은 아래와 같은 의미가 있음
유 : 본 공시사항은 한국거래소 유가증권시장본부 소관임
코 : 본 공시사항은 한국거래소 코스닥시장본부 소관임
채 : 본 문서는 한국거래소 채권상장법인 공시사항임
넥 : 본 문서는 한국거래소 코넥스시장 소관임
공 : 본 공시사항은 공정거래위원회 소관임
연 : 본 보고서는 연결부분을 포함한 것임
정 : 본 보고서 제출 후 정정신고가 있으니 관련 보고서를 참조하시기 바람
철 : 본 보고서는 철회(간주)되었으니 관련 철회신고서(철회간주안내)를 참고하시기 바람

---

단일회사 주요계정 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/fnlttSinglAcnt.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/fnlttSinglAcnt.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bsns_year	사업연도	STRING(4)	Y	사업연도(4자리) ※ 2015년 이후 부터 정보제공
reprt_code	보고서 코드	STRING(5)	Y	1분기보고서 : 11013
반기보고서 : 11012
3분기보고서 : 11014
사업보고서 : 11011
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
bsns_year	사업 연도	2019
stock_code	종목 코드	상장회사의 종목코드(6자리)
reprt_code	보고서 코드	1분기보고서 : 11013 반기보고서 : 11012 3분기보고서 : 11014 사업보고서 : 11011
account_nm	계정명	ex) 자본총계
fs_div	개별/연결구분	OFS:재무제표, CFS:연결재무제표
fs_nm	개별/연결명	ex) 연결재무제표 또는 재무제표 출력
sj_div	재무제표구분	BS:재무상태표, IS:손익계산서
sj_nm	재무제표명	ex) 재무상태표 또는 손익계산서 출력
thstrm_nm	당기명	ex) 제 13 기 3분기말
thstrm_dt	당기일자	ex) 2018.09.30 현재
thstrm_amount	당기금액	9,999,999,999
thstrm_add_amount	당기누적금액	9,999,999,999
frmtrm_nm	전기명	ex) 제 12 기말
frmtrm_dt	전기일자	ex) 2017.01.01 ~ 2017.12.31
frmtrm_amount	전기금액	9,999,999,999
frmtrm_add_amount	전기누적금액	9,999,999,999
bfefrmtrm_nm	전전기명	ex) 제 11 기말(※ 사업보고서의 경우에만 출력)
bfefrmtrm_dt	전전기일자	ex) 2016.12.31 현재(※ 사업보고서의 경우에만 출력)
bfefrmtrm_amount	전전기금액	9,999,999,999(※ 사업보고서의 경우에만 출력)
ord	계정과목 정렬순서	계정과목 정렬순서
currency	통화 단위	통화 단위

---

단일회사 전체 재무제표 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/fnlttSinglAcntAll.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/fnlttSinglAcntAll.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bsns_year	사업연도	STRING(4)	Y	사업연도(4자리) ※ 2015년 이후 부터 정보제공
reprt_code	보고서 코드	STRING(5)	Y	1분기보고서 : 11013
반기보고서 : 11012
3분기보고서 : 11014
사업보고서 : 11011
fs_div	개별/연결구분	STRING(3)	Y	OFS:재무제표, CFS:연결재무제표
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
reprt_code	보고서 코드	1분기보고서 : 11013 반기보고서 : 11012 3분기보고서 : 11014 사업보고서 : 11011
bsns_year	사업 연도	2018
corp_code	고유번호	공시대상회사의 고유번호(8자리)
sj_div	재무제표구분	BS : 재무상태표 IS : 손익계산서 CIS : 포괄손익계산서 CF : 현금흐름표 SCE : 자본변동표
sj_nm	재무제표명	ex) 재무상태표 또는 손익계산서 출력
account_id	계정ID	XBRL 표준계정ID ※ 표준계정ID가 아닐경우 ""-표준계정코드 미사용-"" 표시
account_nm	계정명	계정명칭 ex) 자본총계
account_detail	계정상세	※ 자본변동표에만 출력 ex) 계정 상세명칭 예시 - 자본 [member]|지배기업 소유주지분 - 자본 [member]|지배기업 소유주지분|기타포괄손익누계액 [member]
thstrm_nm	당기명	ex) 제 13 기
thstrm_amount	당기금액	9,999,999,999 ※ 분/반기 보고서이면서 (포괄)손익계산서 일 경우 [3개월] 금액
thstrm_add_amount	당기누적금액	9,999,999,999
frmtrm_nm	전기명	ex) 제 12 기말
frmtrm_amount	전기금액	9,999,999,999
frmtrm_q_nm	전기명(분/반기)	ex) 제 18 기 반기
frmtrm_q_amount	전기금액(분/반기)	9,999,999,999 ※ 분/반기 보고서이면서 (포괄)손익계산서 일 경우 [3개월] 금액
frmtrm_add_amount	전기누적금액	9,999,999,999
bfefrmtrm_nm	전전기명	ex) 제 11 기말(※ 사업보고서의 경우에만 출력)
bfefrmtrm_amount	전전기금액	9,999,999,999(※ 사업보고서의 경우에만 출력)
ord	계정과목 정렬순서	계정과목 정렬순서
currency	통화 단위	통화 단위

---

배당에 관한 사항 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/alotMatter.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/alotMatter.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bsns_year	사업연도	STRING(4)	Y	사업연도(4자리) ※ 2015년 이후 부터 정보제공
reprt_code	보고서 코드	STRING(5)	Y	1분기보고서 : 11013
반기보고서 : 11012
3분기보고서 : 11014
사업보고서 : 11011
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
corp_name	법인명	법인명
se	구분	유상증자(주주배정), 전환권행사 등
stock_knd	주식 종류	보통주 등
thstrm	당기	9,999,999,999
frmtrm	전기	9,999,999,999
lwfr	전전기	9,999,999,999
stlm_dt	결산기준일	YYYY-MM-DD

---

직원 현황 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/empSttus.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/empSttus.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bsns_year	사업연도	STRING(4)	Y	사업연도(4자리) ※ 2015년 이후 부터 정보제공
reprt_code	보고서 코드	STRING(5)	Y	1분기보고서 : 11013
반기보고서 : 11012
3분기보고서 : 11014
사업보고서 : 11011
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
corp_name	법인명	법인명
fo_bbm	사 업부문	
sexdstn	성별	남, 여
reform_bfe_emp_co_rgllbr	개정 전 직원 수 정규직	
reform_bfe_emp_co_cnttk	개정 전 직원 수 계약직	
reform_bfe_emp_co_etc	개정 전 직원 수 기타	
rgllbr_co	정규직 수	상근, 비상근
rgllbr_abacpt_labrr_co	정규직 단시간 근로자 수	대표이사, 이사, 사외이사 등
cnttk_co	계약직 수	9,999,999,999
cnttk_abacpt_labrr_co	계약직 단시간 근로자 수	9,999,999,999
sm	합계	9,999,999,999
avrg_cnwk_sdytrn	평균 근속 연수	9,999,999,999
fyer_salary_totamt	연간 급여 총액	9,999,999,999
jan_salary_am	1인평균 급여 액	9,999,999,999
rm	비고	
stlm_dt	결산기준일	YYYY-MM-DD

---

타법인 출자현황 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/otrCprInvstmntSttus.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/otrCprInvstmntSttus.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bsns_year	사업연도	STRING(4)	Y	사업연도(4자리) ※ 2015년 이후 부터 정보제공
reprt_code	보고서 코드	STRING(5)	Y	1분기보고서 : 11013
반기보고서 : 11012
3분기보고서 : 11014
사업보고서 : 11011
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
corp_name	회사명	공시대상회사명
inv_prm	법인명	법인명
frst_acqs_de	최초 취득 일자	최초취득일자(YYYYMMDD)
invstmnt_purps	출자 목적	출자목적(자회사 등)
frst_acqs_amount	최초 취득 금액	9,999,999,999
bsis_blce_qy	기초 잔액 수량	9,999,999,999
bsis_blce_qota_rt	기초 잔액 지분 율	0.00
bsis_blce_acntbk_amount	기초 잔액 장부 가액	9,999,999,999
incrs_dcrs_acqs_dsps_qy	증가 감소 취득 처분 수량	9,999,999,999
incrs_dcrs_acqs_dsps_amount	증가 감소 취득 처분 금액	9,999,999,999
incrs_dcrs_evl_lstmn	증가 감소 평가 손액	9,999,999,999
trmend_blce_qy	기말 잔액 수량	9,999,999,999
trmend_blce_qota_rt	기말 잔액 지분 율	0.00
trmend_blce_acntbk_amount	기말 잔액 장부 가액	9,999,999,999
recent_bsns_year_fnnr_sttus_tot_assets	최근 사업 연도 재무 현황 총 자산	9,999,999,999
recent_bsns_year_fnnr_sttus_thstrm_ntpf	최근 사업 연도 재무 현황 당기 순이익	9,999,999,999
stlm_dt	결산기준일	YYYY-MM-DD

---
유상증자 결정 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/piicDecsn.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/piicDecsn.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bgn_de	시작일(최초접수일)	STRING(8)	Y	검색시작 접수일자(YYYYMMDD) ※ 2015년 이후 부터 정보제공
end_de	종료일(최초접수일)	STRING(8)	Y	검색종료 접수일자(YYYYMMDD) ※ 2015년 이후 부터 정보제공
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
corp_name	회사명	공시대상회사명
nstk_ostk_cnt	신주의 종류와 수(보통주식 (주))	9,999,999,999
nstk_estk_cnt	신주의 종류와 수(기타주식 (주))	9,999,999,999
fv_ps	1주당 액면가액 (원)	9,999,999,999
bfic_tisstk_ostk	증자전 발행주식총수 (주)(보통주식 (주))	9,999,999,999
bfic_tisstk_estk	증자전 발행주식총수 (주)(기타주식 (주))	9,999,999,999
fdpp_fclt	자금조달의 목적(시설자금 (원))	9,999,999,999
fdpp_bsninh	자금조달의 목적(영업양수자금 (원))	9,999,999,999
① 2019년 12월 9일부터 추가됨
fdpp_op	자금조달의 목적(운영자금 (원))	9,999,999,999
fdpp_dtrp	자금조달의 목적(채무상환자금 (원))	9,999,999,999
① 2019년 12월 9일부터 추가됨
fdpp_ocsa	자금조달의 목적(타법인 증권 취득자금 (원))	9,999,999,999
fdpp_etc	자금조달의 목적(기타자금 (원))	9,999,999,999
ic_mthn	증자방식	증자방식
ssl_at	공매도 해당여부	공매도 해당여부
ssl_bgd	공매도 시작일	공매도 시작일
ssl_edd	공매도 종료일	공매도 종료일

---

소송 등의 제기 개발가이드

기본 정보
메서드	요청URL	인코딩	출력포멧
GET	https://opendart.fss.or.kr/api/lwstLg.json	UTF-8	JSON
GET	https://opendart.fss.or.kr/api/lwstLg.xml	UTF-8	XML
요청 인자
요청키	명칭	타입	필수여부	값설명
crtfc_key	API 인증키	STRING(40)	Y	발급받은 인증키(40자리)
corp_code	고유번호	STRING(8)	Y	공시대상회사의 고유번호(8자리)
※ 개발가이드 > 공시정보 > 고유번호 참고
bgn_de	시작일(최초접수일)	STRING(8)	Y	검색시작 접수일자(YYYYMMDD) ※ 2015년 이후 부터 정보제공
end_de	종료일(최초접수일)	STRING(8)	Y	검색종료 접수일자(YYYYMMDD) ※ 2015년 이후 부터 정보제공
응답 결과
응답키	명칭	출력설명
result		
status	에러 및 정보 코드	(※메시지 설명 참조)
message	에러 및 정보 메시지	(※메시지 설명 참조)
list		
rcept_no	접수번호	접수번호(14자리)

※ 공시뷰어 연결에 이용예시
- PC용 : https://dart.fss.or.kr/dsaf001/main.do?rcpNo=접수번호
corp_cls	법인구분	법인구분 : Y(유가), K(코스닥), N(코넥스), E(기타)
corp_code	고유번호	공시대상회사의 고유번호(8자리)
corp_name	회사명	공시대상회사명
icnm	사건의 명칭	사건의 명칭
ac_ap	원고ㆍ신청인	원고ㆍ신청인
rq_cn	청구내용	청구내용
cpct	관할법원	관할법원
ft_ctp	향후대책	향후대책
lgd	제기일자	제기일자
cfd	확인일자	확인일자