package de.falke.financecommander.bank;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/banks")
@AllArgsConstructor
public class BankController {

    private final BankService bankService;

    @GetMapping
    public List<Bank> getAllBanks() {
        return this.bankService.getAllBanks();
    }

    @PostMapping
    public void addBank(@RequestBody Bank bank) {
        this.bankService.addBank(bank);
    }
}
