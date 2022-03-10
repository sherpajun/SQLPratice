--MMB100 --���� ������
--MMB150 --���� ������
--LEA130 -- �԰� ���� ���� ���̺�
--LEA100 --�԰�

--���԰�


SELECT A.po_no
	,B.po_sq 
	,B.itm_id
	,B.po_qty
	,ISNULL(D.in_qty,0) AS 'in_qty'
	,ISNULL(B.po_qty,0) - ISNULL(D.in_qty,0) AS '���԰����'
FROM MMB100 A 
JOIN MMB150 B ON B.PO_NO = A.PO_NO
LEFT JOIN LEA130 C ON C.po_no = B.po_no AND C.po_sq = B.po_sq
LEFT JOIN LEA100 D ON D.in_no = C.in_no AND D.in_sq = C.in_sq 

--��� ���ֿ� ���� ���԰� 
--���� ������- ���ֹ�ȣPO_NO
--���� ������ - PO_QTY, ITM_ID ,PO_NO
--�԰� ���� - PO_NO, PO_SQ
--�԰� - ITM_ID, IN_QTY
--���ּ���-�԰���� = ���԰����
-- ǰ�� ���� ���԰� ����
