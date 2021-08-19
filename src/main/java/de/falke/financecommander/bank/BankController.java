package de.falke.financecommander.bank;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/banks")
@AllArgsConstructor
public class BankController {

    private final BankService bankService;

    @GetMapping
    public List<Bank> getAllBanks() {
        return bankService.getAllBanks();
    }
}
