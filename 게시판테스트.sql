--게시판 페이지처리
SELECT * FROM 
		(SELECT rownum r , f.* FROM
						(SELECT *FROM COMMUNITY c ORDER BY idx desc) f)
	WHERE r BETWEEN # {START} AND # {END};

--step 1 : idx 내림차순 정렬
SELECT * FROM COMMUNITY c  ORDER BY idx DESC;

-- step 2 : rownum 컬럼값 사용
SELECT rownum r , f.* FROM
						(SELECT *FROM COMMUNITY c ORDER BY idx desc)f;

-- step 3 :	범위를 지정합니다 1페이지에 글이 10개, 20개 보이므로 start, end 값을 그 갯수에 따라 지정하기
SELECT * FROM
		(SELECT rownum r, f.* FROM
				(SELECT * FROM COMMUNITY c ORDER BY idx desc)f)
				WHERE r BETWEEN 1 AND 10;		--1페이지
SELECT * FROM
		(SELECT rownum r, f.* FROM
				(SELECT * FROM COMMUNITY c ORDER BY idx desc)f)
				WHERE r BETWEEN 11 AND 20;		--2페이지
SELECT * FROM
		(SELECT rownum r, f.* FROM
				(SELECT * FROM COMMUNITY c ORDER BY idx desc)f)
				WHERE r BETWEEN 101 AND 110;		--2페이지
		
					
--새 글 저장   
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','자비를 베푸소서 (외전증보판) 1','재미있게 잘 읽었습니다. 다음 편이 궁금해지네요.');


-- 현재 시퀀스값 가져오기
SELECT COMMUNITY_idx_seq.currval FROM dual;

-- 글 수정
UPDATE COMMUNITY 
SET title='자비를 베푸소서 (번역판) 1', CONTENT ='좋은 글입니다.' ,IP='13.0.1.25'
WHERE IDX =21;

-- 글 1개 가져오기
SELECT * FROM COMMUNITY c WHERE idx=21;

-- 글삭제
DELETE FROM COMMUNITY c WHERE idx=21;

-- 글 갯수
SELECT count(*) FROM COMMUNITY ;


UPDATE COMMUNITY 
	SET 	
			READCOUNT = READCOUNT +1
			WHERE 
			idx = 21;


-- 메인글의 댓글 갯수 조회 : 댓글 테이블 가서 메인글 번호 idx(댓글테이블 컬럼명 mref) 를 확인 후 실행


SELECT count(*)
	FROM COMMUNITYCOMMENTS c 
	WHERE 
		MREF =259;
	
-- 메인 글의 댓글 갯수 업데이트
UPDATE  COMMUNITY 
		SET COMMENTCOUNT =
			(SELECT count(*)
			FROM COMMUNITYCOMMENTS  
			WHERE mref=259)
			WHERE  idx = 259;
-- 메인 글의 댓글 목록 가져오기
SELECT *
		FROM COMMUNITYCOMMENTS c 
		WHERE 
			MREF =259;