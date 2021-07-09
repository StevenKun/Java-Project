package com.example.demo.controller;

import lombok.extern.slf4j.Slf4j;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sound.sampled.Line;
import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


/**
 * 1. 引入需要解析的Excel文件
 * 2. 创建workbook  低版本HSSF 高版本XSSF
 * 3. 處理sheet
 * 4. 處理合并單元格
 * 5.
 */

/**
 * private String equipName;
 * private String cutterFlag;
 * private String cutterName;
 * private String cutterCompany;
 * private String cutterCount;
 * private String cutterLife;
 */
@RestController
@Slf4j
public class ReadController {
    @RequestMapping("/requestExcel")
    public void requestEx(String url) {

        File file = new File(url);

        File[] files = file.listFiles();

        List<String> list = new ArrayList<>();

        for (int i = 0; i < files.length; i++) {
            System.out.println(files.length + files[i].getName());

            if (files[i].getName().endsWith("xls")) {//是.xls文件时才执行
                HSSFWorkbook sheets = null;

                //公式求值器
                try {
                    sheets = new HSSFWorkbook(new FileInputStream(files[i]));
                    int sheetNum = sheets.getNumberOfSheets();
                    for (int s =0 ;s<sheetNum ;s++){
                        HSSFSheet sheetAt = sheets.getSheetAt(s);
                        System.out.println("sheetNum" + sheetNum);
                        int firstRowNumber = 0;
                        int lastRowNumber = sheetAt.getLastRowNum();

                        for (int x = firstRowNumber; x < lastRowNumber; x++) {
                            HSSFRow row = sheetAt.getRow(x);
                            if (row != null) {
                                int lastCellNum = row.getLastCellNum();
                                FormulaEvaluator evaluator = sheets.getCreationHelper().createFormulaEvaluator();
                                for (int y = 0; y < lastCellNum; y++) {
                                    HSSFCell cell = row.getCell(y);


                                    if (cell != null) {
                                        switch (cell.getCellType()) {
                                            case BOOLEAN:
                                                System.out.print(cell.getBooleanCellValue());
                                                break;
                                            case NUMERIC:
                                                System.out.print((int) cell.getNumericCellValue() + "\t");
                                                break;
                                            case STRING:
                                                System.out.print(cell.getStringCellValue() + "\t");
                                                break;
                                            case BLANK:
                                                break;
                                            case ERROR:
                                                System.out.print(cell.getErrorCellValue());
                                                log.info("[错误的文件名]" + files[i].getName() + "\t" + sheetAt.getSheetName() + "\t" + row.getRowNum());
                                                break;
                                            case FORMULA:
                                                    System.out.print((int) evaluator.evaluate(cell).getNumberValue() + "\t");
                                                break;
                                        }


                                    }
                                }
                                System.out.println("\n-----------------------------------------------\n");
                            }
                        }
                    }



                } catch (Exception e) {
                    log.info("[错误的文件名]" + files[i].getName());
                    e.printStackTrace();
                }

            }
        }


    }


}
