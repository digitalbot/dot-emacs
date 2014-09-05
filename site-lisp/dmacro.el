;;
;;      dmacro.el - �L�[����̌J�Ԃ����o & ���s
;;
;;      1993 4/14        original idea by ����r�V���V���[�v
;;                         implemented by ���a�c���������Z�ȑ�
;;                          refinement by ����r�V���V���[�v
;;	1995 3/30 modified for Emacs19 by ����r�V���V���[�v
;;
;;	2002 3              XEmacs�Ή� by �����p�i obata@suzuki.kuee.kyoto-u.ac.jp
;;                                        ���L�s zah07175@rose.zero.ad.jp
;;
;;

;;
;; dmacro.el �́A�J��Ԃ����L�[����񂩂玟�̑����\�������s������
;; ���߂̃v���O�����ł��B����̌J�Ԃ��̌��o�Ƃ��̎��s���w�߂��邽�߂�
;; *dmacro-key* �Ŏw�肷����ʂ́u�J�Ԃ��L�[�v���g�p���܂��B
;;
;; �Ⴆ�΃��[�U��
;;     abcabc
;; �Ɠ��͂�����u�J�Ԃ��L�[�v�������ƁAdmacro.el �� "abc" �̓��͑����
;; �J�Ԃ������o���Ă�������s���A���̌��ʃe�L�X�g��
;;     abcabcabc
;; �ƂȂ�܂��B�܂��A
;;     abcdefab
;; �Ɠ��͂�����u�J�Ԃ��L�[�v�������ƁAdmacro.el �͂���� "abcdef" ��
;; ���͂̌J�Ԃ��Ɣ��f���A�J�Ԃ��̎c��̕�����\�����s���� "cdef" ����͂��A
;; �e�L�X�g��
;;     abcdefabcdef
;; �ƂȂ�܂��B�����ł�����x�u�J�Ԃ��L�[�v�������ƁA"abcdef" �̓���
;; ���J��Ԃ���āA�e�L�X�g��
;;     abcdefabcdefabcdef
;; �ƂȂ�܂��B
;;
;; ������L�[����̌J�Ԃ����F���A���s����邽�߁A�Ⴆ��
;;     line1
;;     line2
;;     line3
;;     line4
;; �Ƃ����e�L�X�g��
;;     % line1
;;     % line2
;;     line3
;;     line4
;; �̂悤�ɕҏW������u�J�Ԃ��L�[�v�������ƃe�L�X�g��
;;     % line1
;;     % line2
;;     % line3
;;     line4
;; �̂悤�ɂȂ�A���̌㉟�����тɎ��̍s���� "% "���ǉ�����Ă����܂��B
;;
;; ���̂悤�ȋ@�\�́A�J�Ԃ��p�^���̔F���ɂ��L�[�{�[�h�}�N���������I��
;; ��`���Ă���ƍl���邱�Ƃ��ł��܂��B�L�[�{�[�h�}�N���̏ꍇ�͑����
;; �J�n����ȑO�ɂ��̂��Ƃ����[�U���F�����ă}�N����o�^����K�v������
;; �܂����Admacro.el �ł͎��ۂɌJ�Ԃ���������Ă��܂�����ł��̂��Ƃ�
;; �C�������ꍇ�ł��u�J�Ԃ��L�[�v�����������ł��̑�����܂����s������
;; ���Ƃ��ł��܂��B�܂��}�N���̒�`���@(����̌�Łu�J�Ԃ��L�[�v������
;; ����)���L�[�{�[�h�}�N���̏ꍇ(�}�N���̊J�n�ƏI�����w�肷��)�ɔ�ׂ�
;; �P���ɂȂ��Ă��܂��B
;;
;; �� �g�p��
;;
;; �E������u��
;;
;; �e�L�X�g���̑S�Ắuabc�v���udef]�ɏC������ꍇ���l���Ă݂܂��B
;; �uabc�v����������L�[����� "Ctrl-S a b c ESC" �ŁA�����
;; "DEL DEL DEL d e f" �Łudef�v�ɏC�����邱�Ƃ��ł��܂��B
;; �����������́uabc�v���������� "Ctrl-S a b c ESC" ����͂������
;; �u�J�Ԃ��L�[�v�������� "DEL DEL DEL d e f" ���\�����s����A�V����
;; �������ꂽ�uabc�v���udef�v�ɏC������܂��B�����ł܂��u�J�Ԃ��L�[�v
;; �������Ǝ��́uabc�v���udef�v�ɏC������܂��B
;; ���̂悤�Ɂu�J�Ԃ��L�[�v�������Ă������Ƃɂ�菇�X�ɕ������
;; �u�����Ă������Ƃ��ł��܂��B
;;
;; �E�r���ɂ�邨�G����
;;
;; �J�Ԃ����܂ފG���ȒP�ɏ������Ƃ��ł��܂��B�Ⴆ�΁A
;;   ��������������������������������������������������������
;;     ����������������������������������������������������
;; �̂悤�ȊG�����������ꍇ�́Akeisen.el �Ȃǂ��g����
;;   ��������
;;     ����
;; �Ə�������Łu�J�Ԃ��v�L�[�������ƁA
;;   ��������
;;     ��������
;; �ƂȂ�A������x�u�J�Ԃ��L�[�v��������
;;   ������������
;;     ������������
;; �ƂȂ�܂��B���l��
;;  ������������������������������������������������
;;  ������������������������������������������������
;; �̂悤�ȊG��
;;  ������  ��
;;  ������
;; �������͂�����u�J�Ԃ��L�[�v��A�����ĉ��������ŕ`�����Ƃ��ł��܂��B
;;
;; �� �J�Ԃ��\���̕��@
;;
;; ���͂̌J�Ԃ��̗\����@�͂��낢��l�����܂����Admacro.el�ł�
;; �ȉ��̂悤�ȗD��x���������Ă��܂��B
;;
;;  (1) �������̓p�^�����\���̒��O��2�x�J�Ԃ���Ă���ꍇ�͂����
;;      �D�悷��B�J�Ԃ��p�^������������ꍇ�͒������̂�D�悷��B
;;
;;      �Ⴆ�΁A�u���킢�����킢���v�Ƃ������͂ł́u���킢���v��
;;      �����p�^�����J��Ԃ��ꂽ�Ƃ������߂ƁA�u���v�Ƃ����p�^����
;;      �J��Ԃ��ꂽ�Ƃ������߂̗������\�ł����A���̏ꍇ
;;      �u���킢���v��D�悵�܂��B
;;
;;  (2) (1)�̏ꍇ�ɂ��Ă͂܂炸�A���O�̓��͗�<s>������ȑO�̓��͗��
;;      �ꕔ�ɂȂ��Ă���ꍇ(���O�̓��͂�<s> <t> <s>�̂悤�Ȍ`��
;;      �Ȃ��Ă���ꍇ)�́A�܂�<t>��\�����A���̎�����<s> <t>��\��
;;      ����B���̂Ƃ�<s>�̒������̂�D�悵�A���̒��ł�<t>���Z������
;;      ��D�悷��B
;;
;;      �Ⴆ�΁uabracadabra�v�Ƃ������͂ł́A<s>=�uabra�v���Œ��Ȃ̂�
;;      <s> <t>=�ucadabra�v�̗\�����D�悳��܂��B
;;
;; �� XEmacs �Ή��ASuper, Hyper, Alt �L�[�̑Ή��ɂ���
;;
;; ���̔łł� XEmacs �ɂ��Ή����܂����B
;; ���݂̂Ƃ��� GNU Emacs 18, 19, 20, 21, XEmacs 21 ��
;; ���삷�邱�Ƃ��m�F�ł��Ă��܂��B
;; �܂��]���� dmacro �ł� Super, Hyper, Alt �̃L�[���͂�
;; �������������Ƃ��ł��܂���ł������A���̃o�[�W�����ł�
;; ������悤�ɂȂ��Ă��܂��B
;; �J��Ԃ��̃L�[�Ƃ��� *dmacro-key* �� Super, Hyper, Alt, Meta
;; ���܂߂��L�[���g�����Ƃ��ł��܂����A���������̍ۂ�
;; �ȉ��̒��ӂɏ]���ĉ������B
;;
;; �� *dmacro-key* �̎w��
;;
;; GNU Emacs �̏ꍇ
;;   Modifier key �Ƃ��� Control �݂̂��g����ꍇ�� "\C-t" �̂悤��
;;   ������Ƃ��Ďw��ł��܂��BMeta, Super, Hyper, Alt �𗘗p����ꍇ�ɂ�
;;   ���ꂼ�� [?\M-t], [?\s-t], [?\H-t], [?\A-t] �̂悤�Ɏw�肵�ĉ������B
;;
;; XEmacs �̏ꍇ
;;   Meta key ���g���ꍇ�ł���L�̂悤�Ȑ����͂���܂���BSuper �����g��
;;   �ꍇ�ɂ� [(super t)] �̂悤�Ɏw�肵�ĉ������B
;;
;; �� �ݒ���@
;;
;;  .emacs�ȂǂɈȉ��̍s�����ĉ������B
;;
;; (defconst *dmacro-key* "\C-t" "�J�Ԃ��w��L�[")
;; (global-set-key *dmacro-key* 'dmacro-exec)
;; (autoload 'dmacro-exec "dmacro" nil t)
;;
;; �I���W�i���̘A����:
;; ����r�V
;; �V���[�v������� �\�t�g�E�F�A������
;; masui@shpcsl.sharp.co.jp
;;
;; 2002/6/3���݂̘A����:
;; ����r�V
;; (��)�\�j�[�R���s���[�^�T�C�G���X������
;; masui@acm.org
;;

(defvar dmacro-array-type
  (if (and (boundp 'emacs-major-version)
	   (>= emacs-major-version 19))
      'vector 'string)
  "dmacro �̓����ŏ�������z��̎�ށB
emacs 19 �ȏ�Ȃ�f�t�H���g�� vector �ɂ���B
string �ł� hyper, super, alt ���܂񂾓��͂̌J��Ԃ���
�����������ł��Ȃ��̂Œ��ӁB
GNU Emacs 18 (Nemacs) ���g���Ă�����ȊO�� vector �Ŗ�肠��܂���B")

(fset 'dmacro-concat
      (cond ((eq dmacro-array-type 'string) 'concat)
	    ((eq dmacro-array-type 'vector) 'vconcat)))

(fset 'dmacro-subseq
      (cond ((featurep 'xemacs) 'subseq)
            ((and (eq dmacro-array-type 'vector)
                  (boundp 'emacs-major-version)
                  (eq emacs-major-version 19))
             (require 'cl)
             'subseq)
            (t 'substring)))

(defvar *dmacro-arry* nil "�J�Ԃ��L�[�z��")
(defvar *dmacro-arry-1* nil "�J�Ԃ��L�[�̕����z��")

(setq dmacro-key
      (cond ((eq dmacro-array-type 'string)
             *dmacro-key*)
            (t
             (let ((key *dmacro-key*))
               (cond ((featurep 'xemacs)
                      (if (arrayp key)
                          (mapvector 'character-to-event key)
                        (vector (character-to-event key))))
                     (t
                      (vconcat key)))))))

(setq dmacro-keys (dmacro-concat dmacro-key dmacro-key))

(defun dmacro-exec ()
  "�L�[����̌J�Ԃ������o�����s����"
  (interactive)
  (let ((s (dmacro-get)))
    (if (null s)
	(message "����̌J�Ԃ���������܂���")
      (execute-kbd-macro s)
      )
    ))

(defun dmacro-event (e)
  (cond
   ((integerp e) e)
   ((eq e 'backspace) 8)
   ((eq e 'tab) 9)
   ((eq e 'enter) 13)
   ((eq e 'return) 13)
   ((eq e 'escape) 27)
   ((eq e 'delete) 127)
   (t 0)
   ))

(defun dmacro-recent-keys ()
  (cond ((eq dmacro-array-type 'vector) (recent-keys))
	((eq dmacro-array-type 'string)
	 (let ((s (recent-keys)) )
	   (if (stringp s) s
	     (concat (mapcar 'dmacro-event s))
	     )))))

(defun dmacro-get ()
  (let ((rkeys (dmacro-recent-keys)) arry)
    (if (if (featurep 'xemacs)
            (let ((keys (vconcat dmacro-key
                                 (or *dmacro-arry-1* *dmacro-arry*)
                                 dmacro-key)))
              (equal keys
                     (subseq rkeys (- (length keys)))))
          (equal dmacro-keys (dmacro-subseq rkeys (- (length dmacro-keys)))))
        (progn
          (setq *dmacro-arry-1* nil)
          *dmacro-arry*)
      (setq arry (dmacro-search (dmacro-subseq rkeys 0 (- (length dmacro-key)))))
      (if (null arry)
          (setq *dmacro-arry* nil)
        (let ((s1 (car arry)) (s2 (cdr arry)))
          (setq *dmacro-arry* (dmacro-concat s2 s1)
                *dmacro-arry-1* (if (equal s1 "") nil s1))
          (setq last-kbd-macro *dmacro-arry*)
          (if (equal s1 "") *dmacro-arry* s1))
        ))))

(defun dmacro-search (array)
  (let* ((arry (dmacro-array-reverse array))
         (sptr  1)
         (dptr0 (dmacro-array-search (dmacro-subseq arry 0 sptr) arry sptr))
         (dptr dptr0)
         maxptr)
    (while (and dptr0
                (not (dmacro-array-search dmacro-key (dmacro-subseq arry sptr dptr0))))
      (if (= dptr0 sptr)
          (setq maxptr sptr))
      (setq sptr (1+ sptr))
      (setq dptr dptr0)
      (setq dptr0 (dmacro-array-search (dmacro-subseq arry 0 sptr) arry sptr))
      )
    (if (null maxptr)
        (let ((predict-arry (dmacro-array-reverse (dmacro-subseq arry (1- sptr) dptr))))
          (if (dmacro-array-search dmacro-key predict-arry)
              nil
            (cons predict-arry (dmacro-array-reverse (dmacro-subseq arry 0 (1- sptr)))))
          )
      (cons "" (dmacro-array-reverse (dmacro-subseq arry 0 maxptr)))
      )
    ))

(defun dmacro-array-reverse (arry)
  (dmacro-concat (reverse (mapcar 'identity arry))))

(defun dmacro-array-search (pat arry &optional start)
  (let* ((len (length pat))
	 (max (- (length arry) len))
	 p found
	 )
    (setq p (if start start 0))
    (while (and (not found) (<= p max))
      (setq found (equal pat (dmacro-subseq arry p (+ p len))))
      (if (not found) (setq p (1+ p)))
      )
    (if found p nil)
    ))
