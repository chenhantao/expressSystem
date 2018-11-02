package cn.edu.cqu.cht.controller

import cn.edu.cqu.cht.model.Kotlin
import cn.edu.cqu.cht.service.KotlinService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import javax.servlet.http.HttpServletRequest

/**
 *
 * @author chenhantao
 * @since 2018/11/2
 */
@Controller
@RequestMapping("/kotlin")
class KotlinController {

    @Autowired
    private val kotlinService: KotlinService? = null

    @GetMapping("/find")
    fun find(request: HttpServletRequest): String {
        val kotlin: Kotlin = kotlinService!!.findById(1L)
        request.session.setAttribute("kotlin", kotlin)
        return "base/kotlinTest"
    }
}