--MMB100 --발주 마스터
--MMB150 --발주 디테일
--LEA130 -- 입고 발주 연계 테이블
--LEA100 --입고

--미입고


SELECT A.po_no
	,B.po_sq 
	,B.itm_id
	,B.po_qty
	,ISNULL(D.in_qty,0) AS 'in_qty'
	,ISNULL(B.po_qty,0) - ISNULL(D.in_qty,0) AS '미입고수량'
FROM MMB100 A 
JOIN MMB150 B ON B.PO_NO = A.PO_NO
LEFT JOIN LEA130 C ON C.po_no = B.po_no AND C.po_sq = B.po_sq
LEFT JOIN LEA100 D ON D.in_no = C.in_no AND D.in_sq = C.in_sq 

--모든 발주에 대한 미입고 
--발주 마스터- 발주번호PO_NO
--발주 디테일 - PO_QTY, ITM_ID ,PO_NO
--입고 연계 - PO_NO, PO_SQ
--입고 - ITM_ID, IN_QTY
--발주수량-입고수량 = 미입고수량
-- 품번 별로 미입고 수량
