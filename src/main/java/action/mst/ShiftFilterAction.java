package action.mst;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import business.dto.LoginUserDto;
import business.dto.mst.ShiftMstMntDto;
import business.logic.mst.ShiftMstMntLogic;
import constant.RequestSessionNameConstant;
import form.mst.ShiftMstMntBean;
import form.mst.ShiftMstMntForm;

public class ShiftFilterAction extends Action {
	
	private Log log = LogFactory.getLog(this.getClass());
	
	    public ActionForward execute(ActionMapping mapping, ActionForm form,
	            HttpServletRequest req, HttpServletResponse res) throws Exception {

	       
	    	

	        log.info(new Throwable().getStackTrace()[0].getMethodName());

	        // セッション
	        HttpSession session = req.getSession();

	        // ログインユーザ情報をセッションより取得
	        LoginUserDto loginUserDto = (LoginUserDto) session.getAttribute(RequestSessionNameConstant.SESSION_CMN_LOGIN_USER_INFO);

	        // フォーム
	        ShiftMstMntForm shiftMstMntForm = (ShiftMstMntForm) form;

	        // フォワードキー
	       

	        // ロジック生成
	        ShiftMstMntLogic shiftMstMntLogic = new ShiftMstMntLogic();

	        // シフト情報を取得する
	        Collection<ShiftMstMntDto> mshiftDataList = shiftMstMntLogic.getShiftData(loginUserDto);

	     

	        // フォームへ一覧をセットする
	        shiftMstMntForm.setShiftMstMntBeanList(dtoToForm(mshiftDataList));
	    	
	        String filterShiftType = shiftMstMntForm.getFilterShiftType();  // フィルタで選ばれたシフトタイプ
	        List<ShiftMstMntBean> filteredShifts = new ArrayList<>();

	        // 全てのシフトを取得
	        List<ShiftMstMntBean> allShifts = shiftMstMntForm.getShiftMstMntBeanList();

	        // フィルタリング
	        if ("regular".equals(filterShiftType)) {
	            for (ShiftMstMntBean shift : allShifts) {
	                if ("通常".equals(shift.getShiftName())) {
	                    filteredShifts.add(shift);
	                }
	            }
	        } else if ("training".equals(filterShiftType)) {
	            for (ShiftMstMntBean shift : allShifts) {
	                if ("研修".equals(shift.getShiftName())) {
	                    filteredShifts.add(shift);
	                }
	            }
	        } else if ("studentTraining".equals(filterShiftType)) {
	            for (ShiftMstMntBean shift : allShifts) {
	                if ("研修(学生)".equals(shift.getShiftName())) {
	                    filteredShifts.add(shift);
	                }
	            }
	        } else if ("oso".equals(filterShiftType)) {
	            for (ShiftMstMntBean shift : allShifts) {
	                if ("遅出".equals(shift.getShiftName())) {
	                    filteredShifts.add(shift);
	                }
	            }
	        } else if ("jita".equals(filterShiftType)) {
	            for (ShiftMstMntBean shift : allShifts) {
	                if ("時短".equals(shift.getShiftName())) {
	                    filteredShifts.add(shift);
	                }
	            }
	        } else {
	            // 「全て表示」が選ばれた場合、全てのシフトを表示
	            filteredShifts = allShifts;
	        }

	        // フィルタリング結果をフォームにセット
	        shiftMstMntForm.setShiftMstMntBeanList(filteredShifts);

	        // 結果を表示
	        return mapping.findForward("success");
	    }
	    
	    private List<ShiftMstMntBean> dtoToForm(Collection<ShiftMstMntDto> colection) {
	        List<ShiftMstMntBean> shiftMstMntBeanList = new ArrayList<ShiftMstMntBean>();

	        for (ShiftMstMntDto dto : colection) {
	            ShiftMstMntBean shiftMstMntBean = new ShiftMstMntBean();
	            shiftMstMntBean.setShiftId(dto.getShiftId());
	            shiftMstMntBean.setShiftName(dto.getShiftName());
	            shiftMstMntBean.setSymbol(dto.getSymbol());
	            shiftMstMntBean.setStartTime(dto.getStartTime());
	            shiftMstMntBean.setEndTime(dto.getEndTime());
	            shiftMstMntBean.setBreakTime(dto.getBreakTime());

	            shiftMstMntBeanList.add(shiftMstMntBean);

	        }
	        return shiftMstMntBeanList;
	    }
	    
	}



