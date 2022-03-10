
SELECT
	A.cust_cd
	--A.po_no
	--B.po_sq 
	,B.itm_id 
	,sum(B.po_qty)as po_qty
	,sum(ISNULL(D.in_qty,0)) AS in_qty
	,sum(ISNULL(B.po_qty,0) - ISNULL(D.in_qty,0)) AS 미입고수량
FROM MMB100 A 
JOIN MMB150 B ON B.PO_NO = A.PO_NO
LEFT JOIN LEA130 C ON C.po_no = B.po_no AND C.po_sq = B.po_sq
LEFT JOIN LEA100 D ON D.in_no = C.in_no AND D.in_sq = C.in_sq 
group by A.cust_cd,B.itm_id

-- 거래처별 품번 별 미입고 수량
-- 거래처별 미입고 수량
--MMB100 --발주 마스터
--MMB150 --발주 디테일
--LEA130 -- 입고 발주 연계 테이블
--LEA100 --입고


