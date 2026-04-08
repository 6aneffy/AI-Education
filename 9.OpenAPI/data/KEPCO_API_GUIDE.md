1. 계약종별 전력사용량 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/contractType.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수	조회연도(YYYY)
month	조회월	STRING	필수	조회월(MM)
metroCd	시도코드	STRING	선택	광역자치단체 코드(ex: 11-서울특별시, 26-부산광역시, 41-경기도)
※ 미선택 시 모든 시도 응답
※ 공통코드(법정) API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 110-청주시, 830-양평군, 680-강남구)
※ 미선택 시 모든 시군구 응답
※공통코드(법정) API로 조회
cntrCd	계약종별	STRING	선택	한국전력 전기계약종별(ex:100-주택용, 200-일반용)
※ 미선택 시 모든 계약종별 응답
※ 공통코드 API로 조회
apiKey	API 인증키	STRING	필수	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	json : JSON 포맷 응답
xml : XML 포맷 응답
※ 미선택 시 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
totData	계약종별 전력사용량 합계 내역	LIST	metroCd 미선택 시 모든 지역의 계약종별 전력사용량 내역을 담은 리스트 자료형
※아래의 응답결과 저장
data	계약종별 전력사용량 내역	LIST	metroCd 선택 시 특정 지역의 계약종별 전력사용량 내역을 담은 리스트 자료형
※아래의 응답결과 저장
year	조회연도	STRING	조회연도(YYYY)
month	조회월	STRING	조회월(MM)
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시 등)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구 등)
cntr	계약종별	STRING	한국전력 전기계약종별(ex:주택용, 일반용 등)
custCnt	고객호수	NUMBER	전기사용 고객 호수(호)
powerUsage	전력사용량	NUMBER	전력사용량 합계(kWh)
bill	전기요금	NUMBER	전기요금 합계(원)
unitCost	평균판매단가	NUMBER	전기요금 평균판매 단가(원/kWh)
cntrPwr	계약전력	NUMBER	계약전력
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/contractType.do?year=2020&month=11&metroCd=11&cityCd=110&cntrCd=100&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
     {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "cntr": "주택용",
       "custCnt": 65209,
       "powerUsage": 20468684,
       "bill": 2366461741,
       "unitCost": 115.6
       "cntrPwr": 350410
     }       
  ]
요청 응답 샘플(선택인자 미입력)
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/contractType.do?year=2020&month=11&metroCd=11&cityCd=110&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
     {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "cntr": "가로등",
       "custCnt": 10287,
       "powerUsage": 793099,
       "bill": 87834879,
       "unitCost": 110.7
       "cntrPwr": 13726
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "cntr": "교육용",
       "custCnt": 128,
       "powerUsage": 7044572,
       "bill": 719036541,
       "unitCost": 102.1
       "cntrPwr": 98545
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "cntr": "농사용",
       "custCnt": 11,
       "powerUsage": 870,
       "bill": 71023,
       "unitCost": 81.6
       "cntrPwr": 55
     }           
     
       ...... 
        
  ]

---

2. 산업분류별 전력사용량 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/industryType.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수 	조회연도(YYYY)
month	조회월	STRING	필수 	조회월(MM)
metroCd	시도코드	STRING	선택	광역자치단체 코드(ex: 11-서울특별시, 26-부산광역시, 41-경기도)
※ 미선택 시 모든 시도 응답
※ 공통코드(법정) API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 110-청주시, 830-양평군, 680-강남구)
※ 미선택 시 모든 시군구 응답
※ 공통코드(법정) API로 조회
bizCd	산업분류코드	STRING	선택	한국표준산업분류(ex: C-제조업, H-운수업)
※ 미선택 시 모든 산업분류 응답
※ 공통코드 API로 조회
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
totData	산업분류별 전력사용량 합계 내역	LIST	metroCd 미선택 시 모든 지역의산업분류별 전력사용량 내역을 담은 리스트 자료형
※아래의 응답결과 저장
data	산업분류별 전력사용량 내역	LIST	metroCd 선택 시 특정 지역의 산업분류별 전력사용량 내역을 담은 리스트 자료형
※아래의 응답결과 저장
year	조회연도	STRING	조회연도(YYYY)
month	조회월	STRING	조회월(MM)
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구)
biz	산업분류명	STRING	표준 산업분류명(ex: 제조업, 운수업)
custCnt	고객호수	NUMBER	전기사용 고객 호수(호)
powerUseage	전력사용량	NUMBER	전력사용량 합계(kWh)
bill	전기요금	NUMBER	전기요금 합계(원)
unitCost	평균판매단가	NUMBER	전기요금 평균판매 단가(원/kWh)
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/industryType.do?year=2020&month=11&metroCd=11&cityCd=110&bizCd=C&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "제조업",
       "custCnt": 3970,
       "powerUsage": 5373910,
       "bill": 664941963,
       "unitCost": 123.7
     }
  ]
요청 응답 샘플(선택인자 미입력)
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/industryType.do?year=2020&month=11&metroCd=11&cityCd=110&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "건설업",
       "custCnt": 138,
       "powerUsage": 143709,
       "bill": 20454300,
       "unitCost": 142.3
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "공공행정, 국방 및 사회보장 행정",
       "custCnt": 203,
       "powerUsage": 4116664,
       "bill": 517684431,
       "unitCost": 125.8
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "광업",
       "custCnt": 32,
       "powerUsage": 43852,
       "bill": 5339820,
       "unitCost": 121.8
     }
     
       ......
     
  ]

---

3. 업종별 전력사용량 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/businessType.do	UTF-8	JSON, XML
요청 인자
ㅇ
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수	조회연도(YYYY)
month	조회월	STRING	필수	조회월(MM)
metro	시도명	STRING	선택	광역자치단체명(ex:서울특별시, 부산광역시, 충청남도)
※ 미선택 시 모든 시도 응답
※ 공통코드(법정) API로 조회
city	시군구명	STRING	선택	기초자치단체명(ex:강남구, 해운대구, 천안시 동남구)
※ 미선택 시 모든 시군구 응답
※공통코드(법정) API로 조회
bizType	업종명	STRING	선택	업종명 (ex: 1차 금속, 가구및기타)
apiKey	API 인증키	STRING	필수	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	json : JSON 포맷 응답
xml : XML 포맷 응답
※ 미선택 시 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	업종별 전력사용량 내역	LIST	사용연도와 시도, 시군구명을 기준으로 업종별 전력사용현황 리스트 자료형
※아래의 응답결과 저장
year	조회연도	STRING	조회연도( YYYY)
month	조회월	STRING	조회월(MM)
metro	시도명	STRING	시도명
city	시군구명	STRING	시군구명
bizType	업종별	STRING	업종별
custCnt	고객호수	STRING	고객호수
powerUsage	전력사용량	STRING	전력사용량
cntrPwr	계약전력	STRING	계약전력
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/businessType.do?year=2021&month=03&metro=서울특별시&city=노원구&bizType=섬      유&apiKey=xxx&returnType=xml
API 응답 예시(JSON)	
"data" 
: [
     {
       "year": "2021",
       "month": "03",
       "metro": "서울특별시",
       "city": "노원구",
       "bizType": "섬      유",
       "custCnt": 83,
       "powerUsage": 207983,
       "cntrPwr": 1705
     }       
  ]

---

4. 가구평균 전력사용량 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수 	조회연도(YYYY)
month	조회월	STRING	필수 	조회월(MM)
metroCd	시도코드	STRING	필수 	광역자치단체 코드(ex: 11-서울특별시, 26-부산광역시, 41-경기도)
※ 미선택 시 모든 시도 응답
※ 공통코드(법정) API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 110-청주시, 830-양평군, 680-강남구)
※ 미선택 시 모든 시군구 응답
※공통코드(법정) API로 조회
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	가구평균 전력사용량 내역	LIST	가구평균 전력사용량 내역을 담은 리스트 자료형
※아래의 응답결과 저장
year	조회연도	STRING	조회연도(YYYY)
month	조회월	STRING	조회월(MM)
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구)
houseCnt	가구수	NUMBER	전기사용 가수 호수(호)
powerUseage	평균 전력사용량	NUMBER	평균 전력사용량(kWh)
bill	평균 전기요금	NUMBER	평균 전기요금(원)
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do?year=2020&month=11&metroCd=11&cityCd=12&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "중구",
       "houseCnt": 72787,
       "powerUsage": 199.36,
       "bill": 21091
     }
  ]
요청 응답 샘플(선택인자 미입력)
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/powerUsage/houseAve.do?year=2020&month=11&metroCd=11&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "성동구",
       "houseCnt": 140446,
       "powerUsage": 231.08,
       "bill": 24202
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "도봉구",
       "houseCnt": 147436,
       "powerUsage": 230.37,
       "bill": 23216
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "은평구",
       "houseCnt": 224144,
       "powerUsage": 221.26,
       "bill": 23811
     }
     
       ......      
       
  ]

---

5. 산업분류별 전기사용고객 증감 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/change/custNum/industryType.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수 	조회연도(YYYY)
month	조회월	STRING	필수 	조회월(MM) ex) 5월이면 '05'
metroCd	시도코드	STRING	필수 	광역자치단체 코드(ex: 11-서울특별시, 26-부산광역시, 41-경기도)
※ 공통코드(법정) API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 110-청주시, 830-양평군, 680-강남구)
※ 미선택 시 모든 시군구 응답
※공통코드(법정) API로 조회
bizCd	산업분류코드	STRING	선택	한국표준산업분류(ex: C-제조업, H-운수업)
※ 미선택 시 모든 산업분류 응답
※ 공통코드 API로 조회
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	산업분류별 전기사용고객 증감 내역	LIST	metroCd 선택 지역의 산업분류별 전기사용고객 증감 내역을 담은 리스트 자료형
※아래의 응답결과 저장
year	조회연도	STRING	조회연도(YYYY)
month	조회월	STRING	조회월(MM)
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구)
biz	산업분류명	STRING	표준 산업분류명(ex: 농업, 제조업)
new	전기사용 신설	NUMBER	전기사용 신설건수(건)
expansion	전기사용 증설	NUMBER	전기사용 증설건수(건)
cancel	전기사용 해지	NUMBER	전기사용 해지건수(건)
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/change/custNum/industryType.do?year=2020&month=11&metroCd=11&cityCd=110&bizCd=C&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "제조업",
       "new": 45,
       "expansion": 24,
       "cancel": 29
     }
  ]
요청 응답 샘플(선택인자 미입력)
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/change/custNum/industryType.do?year=2020&month=11&metroCd=11&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "교육 서비스업",
       "new": 0,
       "expansion": 1500,
       "cancel": 0
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "도매 및 소매업",
       "new": 18,
       "expansion": 0,
       "cancel": 126
     }
    ,{
       "year": "2020",
       "month": "11",
       "metro": "서울특별시",
       "city": "종로구",
       "biz": "부동산업 및 임대업",
       "new": 1612,
       "expansion": 479,
       "cancel": 1075
     }
     
       ......     
       
  ]

---

7. 전기차충전소 설치현황 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
metroCd	시도코드	STRING	필수 	광역자치단체 코드(ex: 11-서울특별시, 21-부산광역시, 31-경기도)
※ 미선택 시 모든 시도 응답
※ 공통코드 API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 60-청주시, 43-양평군, 26-강남구)
※ 미선택 시 모든 시군구 응답
※ 공통코드 API로 조회
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	전기차충전소 설치현황 내역	LIST	전기차충전소 설치현황 내역을 담은 리스트 자료형
※아래의 응답결과 저장
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구)
stnPlace	건물명	STRING	건물명
stnAddr	전체주소	STRING	전기차 충전소 설치주소
rapidCnt	급속충전기 대수	NUMBER	전기차 급속충전기 대수(대)
slowCnt	완속충전기 대수	NUMBER	전기차 완속충전기 대수(대)
carType	지원차종	STRING	지원차종
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do?metroCd=11&cityCd=11&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "metro": "서울특별시",
       "city": "종로구",
       "stnPlace": "SK렌터카 본사",
       "stnAddr": "서울특별시 종로구 관철동 7-3",
       "rapidCnt": 1,
       "slowCnt": 2
       "carType": SM3 Z.E,테슬라
     }
    ,{
       "metro": "서울특별시",
       "city": "종로구",
       "stnPlace": "경희궁의아침3단지 아파트",
       "stnAddr": "서울특별시 종로구 내수동 사직로8길 34",
       "rapidCnt": 0,
       "slowCnt": 2
       "carType": SM3 Z.E,레이EV,소울EV,닛산리프,아이오닉EV,BMW i3,스파크EV,볼트EV,테슬라
     }
    ,{
       "metro": "서울특별시",
       "city": "종로구",
       "stnPlace": "광화문스페이스본 아파트",
       "stnAddr": "서울특별시 종로구 사직동 사직로8길 4",
       "rapidCnt": 1,
       "slowCnt": 3
       "carType": SM3 Z.E,레이EV,소울EV,닛산리프,아이오닉EV,BMW i3,스파크EV,볼트EV,테슬라
     }
     
       ......     
       
  ]

---

8. 신재생에너지 계약현황 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/renewEnergy.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
year	조회연도	STRING	필수 	조회연도(YYYY)
metroCd	시도코드	STRING	선택	광역자치단체 코드(ex: 11-서울특별시, 21-부산광역시, 31-경기도)
※ 미선택 시 모든 시도 응답
※ 공통코드 API로 조회
genSrcCd	발전원 코드	STRING	선택	발전방법(ex: 1-태양광, 2-소수력)
※ 미선택 시 모든 발전원 응답
※ 공통코드 API로 조회가능
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	신재생에너지 계약현황 내역	LIST	신재생에너지 계약현황 내역을 담은 리스트 자료형
※아래의 응답결과 저장
genSrc	발전원	STRING	발전방법(ex: 태양광, 풍력)
metro	시도명	STRING	광역자치단체 명(ex:서울특별시, 경기도, 부산광역시)
city	시군구명	STRING	기초자치단체 명(ex:청주시, 양평군, 강남구)
cnt	개수	NUMBER	신재생 에너지 발전기 개수
capacity	발전용량	NUMBER	신재생 에너지 발전용량(kWh)
areaCnt	광역자치단체별 발전기 개수	NUMBER	광역자치단체 기준(metro) 발전기 합계
areaCapacity	광역자치단체별 발전용량	NUMBER	광역자치단체 기준(metro) 발전용량 합계(kWh)
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/renewEnergy.do?year=2019&metroCd=11&genSrcCd=1&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "genSrc": "태양광",
       "metro": "서울",
       "city": "강남구",       
       "cnt": 18,
       "capacity": 1563.96
       "areaCnt": 411
       "areaCapacity": 22247.64
     }
    ,{
       "genSrc": "태양광",
       "metro": "서울",
       "city": "강동구",       
       "cnt": 17,
       "capacity": 686.7
       "areaCnt": 411
       "areaCapacity": 22247.64
     }
    ,{
       "genSrc": "태양광",
       "metro": "서울",
       "city": "강북구",       
       "cnt": 21,
       "capacity": 685.66
       "areaCnt": 411
       "areaCapacity": 22247.64
     }
       
       ......       
       
  ]

---

전자입찰 계약정보 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/electContract.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
companyId	회사구분	STRING	선택	COM01 = 한국전력공사, COM02 = 한국서부발전(주), COM03 = 한국전력국제원자력대학원대학교, COM04 = 한국남부발전(주), COM05 = 한국중부발전(주), COM06 = 한국남동발전(주), COM08 = 한국동서발전(주), COM09 = 한국전력기술(주), COM10 = 한전KPS(주), COM11 = 한국전력거래소, COM12 = 한국원자력연료(주), COM14 = 한국발전교육원, COM16 = 한국해상풍력(주), COM19 = KAPES주식회사
noticeBeginDate	공고시작일	STRING	필수	ex) 20250701
noticeEndDate	공고종료일	STRING	필수	ex) 20250710 (최대 90일)
no	공고번호	STRING	선택	
name	입찰건명	STRING	선택	
bidAttendReqCloseDatetime	입찰신청마감일시	STRING	선택	
progressState	공고등록완료여부	STRING	선택	PreAttendProgress = 공고진행, Close = 마감, Fail = 유찰, OpenTimed = 개찰, Final = 공고종료,
AttendProgress = 입찰진행
apiKey	API 인증키	STRING	필수	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	전자입찰 계약정보	LIST	전자입찰 계약정보 내역을 담은 리스트 자료형
※아래의 응답결과 저장
purchaseType	구분	STRING	Product = 자재구매, ConstructionService = 공사용역
companyId	회사구분	STRING	
no	공고번호	STRING	
name	입찰건명	STRING	
presumedPrice	추정가격	STRING	
noticeDate	공고일시	STRING	
bidAttendReqCloseDatetime	입찰신청마감일시	STRING	
beginDatetime	투찰시작일시	STRING	
endDatetime	입찰종료일시	STRING	
createDatetime	등록년월시분초	STRING	
etc	입찰참가자격	STRING	
deliveryLocation	납품장소	STRING	
deliveryDueDate	납기일	STRING	
bidAttendRestrict	참가자격	STRING	
bidAttendDocument	입찰참가 신청서류	STRING	
bidBondBelong	입찰 보증금귀속	STRING	
contractBeginEndDate	계약착수일	STRING	
mailBidDistribution	계약조건 공시장소	STRING	
bidNullification	입찰무효사항	STRING	
moreInformation	추가정보제공처	STRING	
progressState	공고등록완료여부	STRING	PreAttendProgress = 공고진행, Close = 마감, Fail = 유찰, OpenTimed = 개찰, Final = 공고종료, AttendProgress = 입찰진행
emergencyNoticeYn	공고구분	STRING	1:긴급, 2:보통
bidTypeDetail	낙찰자결정방법설명	STRING	
competitionType	계약방법	STRING	Open = 일반경쟁, Destination = 지명경쟁, Limited = 제한경쟁, Private = 수의
vendorAwardType	입찰방법	STRING	
bidType	낙찰방법	STRING	LimitedLowestPrice = 제한적최저가, LowestPrice = 최저가, QualifiedEval = 적격심사
CollectivelyBid = 일괄입찰, Nego = 협상, TotalEvalSuccess = 종합심사낙찰제
placeName	발주기관	STRING	
contractReqDepartmentName	계약의뢰부서	STRING	
presumedAmount	추정금액	STRING	
estimatedPriceBasicAmount	예비가격기초금액	STRING	
bidAttendReqBeginDatetime	입찰신청시작일시	STRING	
fieldIntroYn	현장설명여부	STRING	1 = 현장설명회 있음, 0 = 현장설명회 없음
fieldIntroBeginDatetime	현장설명날짜	STRING	
pqEvalYn	pq 심사구분	STRING	
jointSupplyDemandYn	공동수급여부	STRING	1 = 공동수급 가능, 0 = 공동수급 불가
jointSupplyDemandVendorCnt	공동수급업체개수	STRING	
itemType	도급구분	STRING	Construction = 공사 , Service = 용역
openMethod	개찰방법	STRING	
creatorName	계약담당자	STRING	
subcontractBudgetAmount	도급금액	STRING	
approximateAmount	사정금액	STRING	
bidLocation	방문입찰장소	STRING	
filenlink1	파일첨부링크1	STRING	
filename1	첨부파일명1	STRING	
filenlink2	파일첨부링크2	STRING	
filename2	첨부파일명2	STRING	
filenlink3	파일첨부링크3	STRING	
filename3	첨부파일명3	STRING	
filenlink4	파일첨부링크4	STRING	
filename4	첨부파일명4	STRING	
filenlink5	파일첨부링크5	STRING	
filename5	첨부파일명5	STRING	
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/electContract.do?companyId=COM01&noticeBeginDate=20220919&noticeEndDate=20220920&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "-": "-",
       "beginDatetime": "20220919000000",
       "bidAttendDocument": "가.규격입찰서 : 규격입찰서를 입찰서 제출마감일시까지 온라인으로 제출 (마감후 평가 진행)
　  ※ 규격입찰서의 용량은 100M이하로 용량을 조정하여 제출하시기 바랍니다. 
　     도면,사진 등의 이미지 자료는 변환하여 같이 작성되어야 합니다. 
　     규격입찰서 전송시간이 제출마감시간을 초과하는 경우 미제출처리가 되오니 
　     마감일시전까지 충분한 시간을 두고 제출하여 주시기 바랍니다. 
　나. 가격입찰서 : 온라인전송(규격입찰서 적격자에 한해 가격입찰 실시, 가격입찰일시는 해당자에게 별도 통보 예정)",
       "bidAttendReqBeginDatetime": "-",
       "bidAttendReqCloseDatetime": "20220929170000",
       "companyId": COM01
       "competitionType": -
       "contractBeginEnddate": 낙찰후 7일이내 산출내역서를 제출하고 10일이내에 계약을 체결하여야 하며 위 납기내에 납품하여야 합니다.
       "filename1": 공고_구매규격서.pdf
       "filenlink1": http://srm.kepco.net/printDownloadAttachment.do?id=9d4bd984-31a6-46e3-954d-714820a21799
       "mailBidDistribution": 한국전력공사 전력연구원 기획관리실 경영지원부
       : .......응답결과 참고
     }
  ]
요청 응답 샘플(선택인자 미입력)
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/EVchargeManage.do?&noticeBeginDate=20220919&noticeEndDate=20220920&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "-": "-",
       "begindatetime": "20220919000000",
       "bidattenddocument": "가.규격입찰서 : 규격입찰서를 입찰서 제출마감일시까지 온라인으로 제출 (마감후 평가 진행)
　  ※ 규격입찰서의 용량은 100M이하로 용량을 조정하여 제출하시기 바랍니다. 
　     도면,사진 등의 이미지 자료는 변환하여 같이 작성되어야 합니다. 
　     규격입찰서 전송시간이 제출마감시간을 초과하는 경우 미제출처리가 되오니 
　     마감일시전까지 충분한 시간을 두고 제출하여 주시기 바랍니다. 
　나. 가격입찰서 : 온라인전송(규격입찰서 적격자에 한해 가격입찰 실시, 가격입찰일시는 해당자에게 별도 통보 예정)",
       "bidAttendReqBeginDatetime": "-",
       "bidAttendReqCloseDatetime": "20220929170000",
       "companyId": COM01
       "competitionType": -
       "contractBeginEnddate": 낙찰후 7일이내 산출내역서를 제출하고 10일이내에 계약을 체결하여야 하며 위 납기내에 납품하여야 합니다.
       "filename1": 공고_구매규격서.pdf
       "filenlink1": http://srm.kepco.net/printDownloadAttachment.do?id=9d4bd984-31a6-46e3-954d-714820a21799
       "mailBidDistribution": 한국전력공사 전력연구원 기획관리실 경영지원부
       : .......응답결과 참고
     }
  ]

---

12. 분산전원 연계정보 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/dispersedGeneration.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
metroCd	시도코드	STRING	선택	광역자치단체 코드(ex: 11-서울특별시, 26-부산광역시, 44-충청남도)
※ 미선택 시 모든 시도 응답
※ 공통코드(법정) API로 조회
cityCd	시군구코드	STRING	선택	기초자치단체 코드(ex: 680-강남구, 350-해운대구, 131-천안시 동남구)
※ 미선택 시 모든 시군구 응답
※공통코드(법정) API로 조회
addrLidong	동/면	STRING	선택	동/면 (ex: )
addrLi	리	STRING	선택	리 (주소)
addrJibun	상세번지	STRING	선택	상세번지 (주소)
substCd	변전소코드	STRING	선택	변전소코드
apiKey	API 인증키	STRING	필수	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	json : JSON 포맷 응답
xml : XML 포맷 응답
※ 미선택 시 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	분산형전원용량정보 내역	LIST	시도코드, 시군구코드, 도로명을 기준으로 분산형전원누적 연계용량 및 여유용량정보 담은 리스트 자료형
※아래의 응답결과 저장
substCd	변전소 코드	STRING	변전소 코드
substNm	변전소명	STRING	변전소명
jsSubstPwr	변전소 용량	STRING	변전소 용량
substPwr	변전소 누적 연계용량	STRING	변전소 누적 연계용량
mtrNo	변압기 번호	STRING	변압기 번호
jsMtrPwr	변압기 용량	STRING	변압기 용량
mtrPwr	변압기 누적 연계용량	STRING	변압기 누적 연계용량
dlCd	DL 코드	STRING	DL 코드
dlNm	DL명	STRING	DL명
jsDlPwr	DL 용량	STRING	DL 용량
dlPwr	DL 누적연계용량	STRING	DL 누적연계용량
vol1	변전소 여유용량	STRING	변전소 여유용량
vol2	변압기 여유용량	STRING	변압기 여유용량
vol3	DL 여유용량	STRING	DL 여유용량
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/dispersedGeneration.do?metroCd=44&cityCd=131&addrLidong=광덕면&addrLi=광덕리&addrJibun=142-1&apiKey=xxx&returnType=xml
API 응답 예시(JSON)	
"data" 
: [
     {
       "substCd": "D360",
       "substNm": "풍세",
       "jsSubstPwr": "0",
       "substPwr": "30721",
       "mtrNo": "1",
       "jsMtrPwr": 0,
       "mtrPwr": 21958,
       "dlCd": 07,
       "dlNm": 공원
       "jsDlPwr": 0
       "dlPwr": 7890
       "vol1": 
       "vol2": 
       "vol3": 
     }       
  ]

---

13. 공통코드정보 API 가이드
요청 기본정보
메서드	요청URL	인코딩	응답포맷
GET, POST	https://bigdata.kepco.co.kr/openapi/v1/commonCode.do	UTF-8	JSON, XML
요청 인자
항목명	항목설명	타입	필수여부	세부내용
codeTy	코드유형	STRING	필수 	조회하고자 하는 코드 유형
시도 - metroCd, 시군구 - cityCd,
법정동시도 - lglDngMetroCd, 법정동시군구 - lglDngCityCd,
계약종별 - cntrCd, 산업분류 - bizCd, 발전원 - genSrcCd, 복지할인 - wfTypeCd
계약종별/산업분류별 전기사용량/산업분류별 전기사용고객증감/요금청구방식 변동추이/복지할인대상/가구평균전력사용량/분산전원연계 법정동코드 사용
apiKey	API 인증키	STRING	필수 	발급받은 API 인증키 40자리
returnType	응답포맷	STRING	선택	JSON 응답 : json
XML 응답 : xml
※ 미선택 시 모든 JSON으로 응답
응답 결과
항목명	항목설명	타입	세부내용
data	공통코드 내역	LIST	공통코드 내역을 담은 리스트 자료형
※아래의 응답결과 저장
(uppoCd)	상위코드	STRING	codeTy = cityCd 또는 codeTy = lglDngCityCd 일 때 상위 시도코드 출력
(uppoCdNm)	상위코드명	STRING	codeTy = cityCd 또는 codeTy = lglDngCityCd 일 때 상위 시도명 출력
codeTy	코드유형	STRING	조회한 코드 유형
시도 - metroCd, 시군구 - cityCd,
법정동시도 - lglDngMetroCd, 법정동시군구 - lglDngCityCd,
계약종별 - cntrCd, 산업분류 - bizCd, 발전원 - genSrcCd, 복지할인 - wfTypeCd
계약종별/산업분류별 전기사용량/산업분류별 전기사용고객증감/요금청구방식 변동추이/복지할인대상/가구평균전력사용량 법정동코드 사용
code	코드값	STRING	공통코드 값(OPEN API 파라미터로 사용)
codeNm	코드명	STRING	코드설명
요청 응답 샘플
API 요청 예시	https://bigdata.kepco.co.kr/openapi/v1/commonCode.do?codeTy=metroCd&apiKey=xxx&returnType=json
API 응답 예시(JSON)	
"data" 
: [
    {
       "codeTy": "metroCd",
       "code": "11",
       "codeNm": "서울특별시"
     }
    ,{
       "codeTy": "metroCd",
       "code": "21",
       "codeNm": "부산광역시"
     }
    ,{
       "codeTy": "metroCd",
       "code": "22",
       "codeNm": "대구광역시"
     }
     
       ......   
       
  ]


---
