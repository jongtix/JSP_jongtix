-- �Խ���
CREATE TABLE pj_board (
    num         NUMBER PRIMARY KEY, -- �۹�ȣ
    flag        NUMBER DEFAULT 0 NOT NULL, -- ī�װ�
    writer      VARCHAR2(20 BYTE) NOT NULL, -- �ۼ���
    subject     VARCHAR2(50 BYTE) NOT NULL, -- ����
    content     VARCHAR2(2000 BYTE) NOT NULL, -- ����
    email       VARCHAR2(30 BYTE), -- �̸���
    readcount   NUMBER DEFAULT 0, -- ��ȸ��
    password    VARCHAR2(20 BYTE) NOT NULL, -- ��й�ȣ
    REF         NUMBER NOT NULL, -- ������ȣ
    re_step     NUMBER DEFAULT 0,
    re_level    NUMBER DEFAULT 0,
    ip          VARCHAR2(30 BYTE) NOT NULL,
    reg_date    DATE DEFAULT SYSDATE, -- �����
    del         CHAR(1 BYTE) DEFAULT 'N' -- ��������
);

--------------------------------------------------------------------
-- ���

DROP TABLE pj_sub_board;

CREATE TABLE pj_sub_board (
    sub_num        NUMBER PRIMARY KEY,
    sub_writer     VARCHAR2(20 BYTE) NOT NULL, -- �ۼ���
    sub_content    VARCHAR2(2000 BYTE) NOT NULL, -- ����
    sub_password   VARCHAR2(20 BYTE) NOT NULL, -- ��й�ȣ
    REF            NUMBER NOT NULL, -- ������ȣ
    reg_date       DATE DEFAULT SYSDATE, -- �����
    del            CHAR(1 BYTE) DEFAULT 'N' -- ��������
);


--------------------------------------------------------------------
-- ���

CREATE TABLE pj_member (
    id             VARCHAR2(20 BYTE), -- �������̵�
    password       VARCHAR2(20 BYTE),
    name           VARCHAR2(20 BYTE),
    rrnum1         VARCHAR2(6), -- �ֹε�Ϲ�ȣ ���ڸ�
    rrnum2         VARCHAR2(7), -- �ֹε�Ϲ�ȣ ���ڸ�
    zipno          VARCHAR2(7 BYTE),
    address1       VARCHAR2(80 BYTE),
    address2       VARCHAR2(50 BYTE),
    tel1           VARCHAR2(3 BYTE),
    tel2           VARCHAR2(4 BYTE),
    tel3           VARCHAR2(4 BYTE),
    email          VARCHAR2(20 BYTE),
    regdate        DATE DEFAULT SYSDATE, -- ������
    use_flag       CHAR(1 BYTE) DEFAULT 0, -- Ż�� ����
    manager_flag   CHAR(1) DEFAULT 0 -- �Ŵ��� ����
);


--------------------------------------------------------------------
-- ��ǰ

CREATE TABLE pj_item (
    num          NUMBER, -- �۹�ȣ
    item_id      NUMBER PRIMARY KEY,
    item_kind    VARCHAR2(30 BYTE), -- ��ǰ ����
    item_name    VARCHAR2(100 BYTE),
    item_price   NUMBER(20),
    item_count   NUMBER(5), -- �Ǹ� ��ǰ ��
    item_image   VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday     DATE, -- ��Ʈ ������
    endday       DATE, -- ��Ʈ ������
    trans_type   VARCHAR2(30), -- �ŷ� ����
    reg_date     DATE -- ��ǰ �����
);


--------------------------------------------------------------------
-- ��Ʈ

CREATE TABLE pj_rent (
    rent_id           NUMBER PRIMARY KEY,
    rent_seller       VARCHAR2(20),
    rent_buyer        VARCHAR2(20),
    item_id           NUMBER,
    item_kind         VARCHAR2(10 BYTE), -- ��ǰ ����
    item_name         VARCHAR2(100 BYTE),
    item_price        NUMBER(20),
    item_count        NUMBER(5), -- �Ǹ� ��ǰ ��
    item_image        VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday          DATE, -- ��Ʈ ������
    endday            DATE, -- ��Ʈ ������
    trans_type        VARCHAR2(30), -- �ŷ� ����
    deliveryname      VARCHAR2(20),
    deliverytel       VARCHAR2(15),
    deliveryaddress   VARCHAR2(200),
    sanction          VARCHAR2(10) DEFAULT '�غ���',
    resanction        VARCHAR2(10),
    reg_date          DATE -- ��ǰ �����
);