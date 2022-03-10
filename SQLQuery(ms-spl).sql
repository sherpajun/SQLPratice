
SELECT
	A.cust_cd
	--A.po_no
	--B.po_sq 
	,B.itm_id 
	,sum(B.po_qty)as po_qty
	,sum(ISNULL(D.in_qty,0)) AS in_qty
	,sum(ISNULL(B.po_qty,0) - ISNULL(D.in_qty,0)) AS ���԰����
FROM MMB100 A 
JOIN MMB150 B ON B.PO_NO = A.PO_NO
LEFT JOIN LEA130 C ON C.po_no = B.po_no AND C.po_sq = B.po_sq
LEFT JOIN LEA100 D ON D.in_no = C.in_no AND D.in_sq = C.in_sq 
group by A.cust_cd,B.itm_id

-- �ŷ�ó�� ǰ�� �� ���԰� ����
-- �ŷ�ó�� ���԰� ����
--MMB100 --���� ������
--MMB150 --���� ������
--LEA130 -- �԰� ���� ���� ���̺�
--LEA100 --�԰�


